#include <iostream> 
#include <array> 
#include <cassert> 
#include <chrono>
#include <random> 
#include <optional> 

using i64 = int64_t;

auto rng {std::minstd_rand0 (std::chrono::system_clock::now().time_since_epoch().count())}; 

template <typename T> 
struct GetSize; 

template <size_t len, typename T> 
struct GetSize<std::array<T, len>> {
    constexpr static size_t size = len; 
}; 

template <int len = 8, typename T = std::array<int, len>> 
i64 evaluate(T const &t) {
    i64 result {}; 
    for (size_t i = 0; i < len; ++i) {
        for (size_t j = i + 1; j < len; ++j) {
            if (t.at(i) == t.at(j)) {
                ++result; 
                continue; 
            }
            if (std::abs(t.at(i) - t.at(j)) == j - i) {
                ++result; 
                continue; 
            }
        }
    }
    constexpr auto maximum_cost = len * (len - 1) / 2; 
    assert (result <= maximum_cost); 
    return maximum_cost - result; 
}

template <int len = 8> 
std::array<int, len> init() {
    std::array<int, len> result; 
    for (int i = 0; i < len; ++i)
        result[i] = i; 
    for (int i = 0; i < len; ++i) {
        using std::swap; 
        swap(result[i], result.at((rng() % (len - i)) + i)); 
    }
    return result; 
}

template <int len = 8, typename T = std::array<int, len>>
std::vector<T> init_group(size_t group_number) {
    std::vector<T> result; 
    result.reserve(group_number); 
    while (group_number--) {
        result.push_back(init()); 
    }
    return result; 
}

template <typename r = std::ratio<1, 10>, typename T> 
T generate_from_two_guys(T const &p1, T const &p2) {
    static_assert (GetSize<std::decay_t<decltype(p1)>>::size == GetSize<std::decay_t<decltype(p2)>>::size); 
    constexpr size_t length = GetSize<std::decay_t<decltype(p1)>>::size; 
    auto get_float = [&] {
        auto k = (double )rng() / (double )std::numeric_limits<std::decay_t<decltype(rng())>>::max();  
        return k;         
    }; 
    constexpr double mut_ratio = (double )r::num / r::den;
    T result; 
    size_t choose = rng() % (1 + length); 
    if (choose == length) {
        result = p2; 
    } else {
        size_t k; 
        for (k = 0; k < choose; ++k) {
            result.at(k) = p1.at(k); 
        }
        for (; k < length; ++k) {
            result.at(k) = p2.at(k); 
        }
        if (get_float() < mut_ratio) {
            result.at(choose) = rng() % length; 
        }
    }
    return result;
}

template <int len = 8, typename T = std::array<int, len>> 
void iter_group(std::vector<T> const &origin, std::vector<T> &next) {
    assert (&origin != &next); 
    next.clear(); 
    next.reserve(origin.size()); 
    std::vector<i64> evaluates; 
    evaluates.reserve(origin.size());
    i64 total{}; 
    for (size_t i = 0; i < origin.size(); ++i) {
        auto e_val = evaluate(origin.at(i)); 
        if (e_val < 0) 
            e_val = 0; 
        total += e_val; 
        evaluates.push_back(e_val); 
    }
    assert (total); 
    auto select = [&] {
        auto r = rng() % total; 
        for (size_t k = 0; k < origin.size(); ++k) {
            if (auto e = evaluates.at(k); r > e) {
                r -= e; 
            } else {
                return k; 
            }
        }
        assert (false); 
    }; 
    static_assert(std::is_same_v<decltype(select()), size_t>); 
    for (size_t unused = 0; unused < origin.size(); ++unused) {
        auto &&f1 = // origin.at(select()); 
            origin[select()]; 
        auto &&f2 = origin.at(select()); 
        next.push_back(generate_from_two_guys(f1, f2)); 
    }
}

template <typename T> 
i64 minimum_cost(T const &t) {
    std::optional<i64> minimum_cost; 
    for (auto &a: t) {
        auto c = evaluate(a); 
        if (!minimum_cost || *minimum_cost < c) {
            minimum_cost = c; 
        }
    }
    assert (minimum_cost); 
    return *minimum_cost; 
}

int main() {
    auto p = init_group(100);
    auto p2 = decltype(p){};
    auto *left = &p; 
    auto *right = &p2; 
    constexpr size_t cnt = 100'000;
    size_t c {}; 
    while (1) {
        iter_group(*left, *right); 
        std::swap(left, right); 
        auto v = minimum_cost(*left); 
        std::cout << v << std::endl; 
        if (v == 28) break; 
        if (++c >= cnt) break; 
    }
    for (auto &i: *left) {
        if (auto e = evaluate(i); e == 28) {
            std::cout << "最终皇后的位置：\n";
            for (auto s: i) {
                std::cout << s << " ";  
            }
            endl(std::cout); 
            std::cout << "差值: " << 28-e << "\t回合数：" << c << "\n"; 
            endl(std::cout); 
        }
    }
}