# readme

## Catalog

+ code
  + build.m
    > 从文件中读取筛选后数据
  + parsepcap.m
    > 多文件处理
  + pcap2matlab.m
    > 调用tshark生成数据文件，然后分段读取这个数据文件，以一个nx1的矩阵形式返回，最后删除掉生成的数据文件
  + preprocess.m
    > 数据预处理
  + p_judge.m
    > 概率分布判定和统计

+ readme.pdf
  > 技术文档与使用说明
+ report.pdf
  > 实验报告

## Used Technology

+ Wireshark

+ Matlab

## Usage

> 在matlab中将文件目录移动到code文件目录下
>
> 然后在matlab的命令行窗口输入以下命令
>
> ```matlab
> p_judge(alpha)
> ```
>
> 其中alpha为显著水平，区间为[0,1]。
>
> 运行过程会花费一两分钟，请耐心等候。
>
> 最终返回结果含义请参见p_judge.m文件中的注释。