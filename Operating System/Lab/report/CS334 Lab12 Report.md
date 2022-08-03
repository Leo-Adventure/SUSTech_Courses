## CS334 Lab 12 Report

**手册第二部分中的inode，如果block_size是4KB，指针大小是4B，一个inode能管理的最大文件大小是多少，写出计算过程**

一个 `block`存储的指针数量：$4KB/4B = 1K = 1024$ 个，由于一个 `inode`有12 个直接指针，分别有一个一级间接指针、二级间接指针、三级间接指针。最大文件大小：$4TB + 4MB + 4GB + 48KB$

**SFS中的inode可以管理的最大文件大小是多少，写出计算过程**

$48KB + 4MB$

**SFS中sfs_disk_inode和sfs_disk_entry的关系是什么**

inode 里面如果是代表着文件，便是直接指向文件对应的数据块，如果代表着目录，便是指向对应的 `entry`