Reproducible Research: Peer Assessment 1
========================================

Loading the file
----------------

### Calculate and report the total number of missing values in the dataset

And filled it with missing data

What is mean total number of steps taken per day?
=================================================

![](PA1_template_files/figure-markdown_strict/unnamed-chunk-3-1.png)

### mean /median

    ## [1] 10766.19

    ## [1] 10765

What is the average daily activity pattern?
===========================================

Print a series Plot. At first aggregate the date for series.

    ## Warning: package 'ggplot2' was built under R version 3.3.2

![](PA1_template_files/figure-markdown_strict/unnamed-chunk-5-1.png)
Which 5-minute interval, on average across all the days in the dataset,
contains the maximum number of steps?

    ##     interval    steps
    ## 104      835 206.1698

Imputing missing values
=======================

1.  Calculate the total number.

<!-- -->

    ## [1] "13.115 %"

1.  Devise a strategy for filling in all of the missing values in
    the dataset...

Replace each missing value with the mean value.

Make a histogram of the total number.
![](PA1_template_files/figure-markdown_strict/unnamed-chunk-10-1.png)
\#\#\# mean/median of the steps

    ## [1] 10766.19

    ## [1] 10766.19

Are there differences in activity patterns between weekdays and weekends
========================================================================

Create a new weekday/Weekend variable in a df.

Aggregate the steps to the different days.

Plot it.
![](PA1_template_files/figure-markdown_strict/unnamed-chunk-14-1.png)
