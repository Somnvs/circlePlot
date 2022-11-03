# circlePlot
two methods for circlePlot



## Circos

### 安装

- 直接从github下载使用
- 使用conda install `conda install -c bioconda circos` 我是使用conda的方法安装的。

### 配置

- circos我安装在conda下名为”WGBS”的环境里面；
- 安装完成后，配置`housekeeping.conf`文件，路径为`/Data2/software/Miniconda3/envs/WGBS/etc/housekeeping.conf`,将`paranoid = yes`改为`paranoid = no`;
- 同时因为数据条目比较多，需要将`max_links`和`max_points_per_track`大小从25000改为250000；

### 文件准备

- Karyogram文件，每个基因组需要单独配置；可以通过samtools faidx生成fai文件，再通过一下命令生成Karyogram文件。

  `awk '{print "chr - "$1" "$1" 0 "$2" white"}' genome.fasta.fai > karyotype.txt`

  参考：https://bioinf.cc/misc/2020/07/12/circos-histograms.html

- 需要绘制的数据，比如绘制每个样本的reads分布、snp的值等等。参考以下链接生成：https://bioinf.cc/misc/2020/07/12/circos-histograms.html

  ``` 
  less MT1.CG.txt
  
  # Chr     Start   End     Site_count
  # chr1    0       100000  0
  # chr1    100000  200000  0
  # chr1    200000  300000  0
  # chr1    300000  400000  0
  # chr1    400000  500000  0
  # chr1    500000  600000  0
  # chr1    600000  700000  0
  # chr1    700000  800000  0
  # chr1    800000  900000  0
  # chr1    900000  1000000 0
  # chr1    1000000 1100000 0
  ```

  

- 示例文件在Circos文件夹：(其中CG.txt结尾文件是我之前绘制甲基化 count分布的数据)

### 使用

- 配置config文件，可以根据我提供的示例config文件进行修改，文件名为"circos.allChromsome.conf";
- config文件重要参数说明：
  - 第一行：karyotype = /Data2/weigs/5.ForTest/92.circosTest/karyotype.txt 填写前面配置的karyotype.txt文件的绝对路径；
  - 49行-90行：填写前面生成的数据文件，务必要嵌套在<plots> </plots>里和<plot> </plot>里；
    ![image](https://user-images.githubusercontent.com/26337757/199650536-35ac2817-2ef3-4a19-929c-bdfa06353b9b.png)

    - type：绘制的类型，可以是line, histogram, heatmap等
    - file：输入文件的绝对路径；
    - show：是否展示；
    - min：确定一个最小值，输入文件的第四行value如果小于min，则将该value改为min；
    - max：确定一个最小值，输入文件的第四行value如果小于max，则将该value改为max；
    - r1：表示某个样本绘图的外圈直径大小，r表示circle的直径；
    - r0：表示某个样本绘图的内圈直径大小，r表示circle的直径；
    - color：表示配色系统，上面截图是热图的配色；

- 运行命令：circos -conf circos.allChromsome.conf ；结果文件名默认为circos.png和circos.svg 注意生成结果后重命名，防止前后分析结果覆盖；
- 分析结果示例：
  ![image](https://user-images.githubusercontent.com/26337757/199650509-b393c3c2-3032-4c08-93ec-feccf71b07c1.png)




### 生成弧形结果，非圆形

- 很简单，修改一下karyotype.txt文件，仅保留染色体1的条目，同时karyotype.txt文件第六列可以根据自己需要绘制的大小自定义填写；示例文件可以参考"karyotype.onlyChr1.txt"；
- 同时修改config文件，在ideogram 条目中，将default改为900u(可以自调节大小测试)；第一行karyotype 注意修改为上一步生成的karyotype.onlyChr1.txt 文件的绝对路径；
- 运行命令`circos -conf circos.onlyChr1.conf`
- 分析结果示例：
  ![image](https://user-images.githubusercontent.com/26337757/199650464-e9433a07-c6c9-4e4e-8c7f-88f20bc2b7b1.png)



### circos 参数的说明：

https://zhuanlan.zhihu.com/p/45095532


## Circlize

### installation

```
conda install -c conda-forge r-circlize
```

### 脚本和示例文件

- 可以参考R脚本“Rscript.CG.r”，分析DNA甲基化CG位点count数的circlePlot图；

- 可以参考R脚本“Rscript.bed.r”，分析MeRIP-seq位点值的circlePlot图；

- 脚本和示例文件存放在文件夹"Circlize"

示例如如下：

![image](https://user-images.githubusercontent.com/26337757/199650360-a125c2ef-6008-4598-98ac-0f3a9954ccd8.png)
![image](https://user-images.githubusercontent.com/26337757/199650377-da9cd1af-17e6-4235-9390-617ad836d21c.png)



