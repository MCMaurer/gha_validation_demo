Read in the data:

    d <- read_csv("data/my_data.csv")

    ## Rows: 100 Columns: 5

    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (3): length, prop, group
    ## dbl (2): weight, count

    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

Set up data validation checks ([see `pointblank` page for
more](https://rich-iannone.github.io/pointblank/articles/VALID-I.html)):

    eval_d <- create_agent(
      tbl = d,
      tbl_name = "my_data",
      label = "Data Validation Demo",
      actions = 
        action_levels(warn_at = 0.01,
                      stop_at = 0.02)
    ) %>% 
      col_is_numeric(vars(weight, length, prop)) %>% 
      col_is_integer(vars(count)) %>% 
      col_is_character(vars(group)) %>% 
      col_vals_gte(vars(count), 0) %>% 
      col_vals_between(vars(prop), 0, 1) %>% 
      interrogate()

Get the HTML widget report:

    eval_d

    eval_d %>% 
      get_agent_report(display_table = F)

    ## # A tibble: 7 × 14
    ##       i type  columns values precon active eval  units n_pass f_pass W     S    
    ##   <int> <chr> <chr>   <chr>  <chr>  <lgl>  <chr> <dbl>  <dbl>  <dbl> <lgl> <lgl>
    ## 1     1 col_… weight  <NA>   <NA>   TRUE   OK        1      1   1    FALSE FALSE
    ## 2     2 col_… length  <NA>   <NA>   TRUE   OK        1      0   0    TRUE  TRUE 
    ## 3     3 col_… prop    <NA>   <NA>   TRUE   OK        1      0   0    TRUE  TRUE 
    ## 4     4 col_… count   <NA>   <NA>   TRUE   OK        1      0   0    TRUE  TRUE 
    ## 5     5 col_… group   <NA>   <NA>   TRUE   OK        1      1   1    FALSE FALSE
    ## 6     6 col_… count   0      <NA>   TRUE   OK      100     99   0.99 TRUE  FALSE
    ## 7     7 col_… prop    0, 1   <NA>   TRUE   OK      100     98   0.98 TRUE  TRUE 
    ## # … with 2 more variables: N <lgl>, extract <int>

For rowwise checks, identify which rows fail and which pass:

    eval_d %>% 
      get_sundered_data(type = "combined") %>% 
      print(n=Inf)

    ## # A tibble: 100 × 6
    ##     length            weight count prop  group .pb_combined
    ##     <chr>              <dbl> <dbl> <chr> <chr> <chr>       
    ##   1 7.59469405865023   14.0      4 0.184 O     pass        
    ##   2 5.61346108442595   17.1      3 0.105 V     pass        
    ##   3 6.11166948355966   10.0      4 0.44  C     pass        
    ##   4 6.85285892317637    9.93     2 0.507 L     pass        
    ##   5 4.43744582277837    4.32     4 0.04  Y     pass        
    ##   6 2.438774268293      9.98     6 0.154 C     pass        
    ##   7 4.45628935353628    9.34     7 0.651 W     pass        
    ##   8 6.47949156911015    9.62     4 0.372 T     pass        
    ##   9 2.94983640043446   10.6      6 0.231 U     pass        
    ##  10 4.52565315606473    8.74     4 0.041 D     pass        
    ##  11 0.898076880622954  14.1      3 0.317 V     pass        
    ##  12 7.23696372467052    9.82     6 0.216 S     pass        
    ##  13 7.15910411217949   11.0      2 0.434 B     pass        
    ##  14 3.95156513603805   11.2      4 0.633 D     pass        
    ##  15 3.93079170517609   13.9      3 0.205 L     pass        
    ##  16 6.24223619184868   10.5      1 0.615 B     pass        
    ##  17 2.5718616695967    10.8      4 0.637 P     pass        
    ##  18 0.546625012295975  10.3      3 0.305 S     pass        
    ##  19 4.79009173109615   10.5      1 0.377 P     pass        
    ##  20 7.08170569555569    9.32     3 0.366 V     pass        
    ##  21 6.22105980011683   10.4      4 0.184 Z     pass        
    ##  22 8.7587643270455     5.75     3 5.3%  K     fail        
    ##  23 5.08835504807847    8.73     2 0.61  W     pass        
    ##  24 3.25190225606591   10.1      3 0.456 N     pass        
    ##  25 4.5821895885725     5.90     3 0.944 E     pass        
    ##  26 4.03403497895183    9.79     5 0.557 L     pass        
    ##  27 3.8637333692928     8.36     3 0.695 H     pass        
    ##  28 5.6659564078817     9.24     5 0.327 C     pass        
    ##  29 5.26903987209986   13.4      5 0.483 L     pass        
    ##  30 3.29241374061623    8.31     3 0.457 D     pass        
    ##  31 4.08685732722897   12.8      5 0.176 E     pass        
    ##  32 5.97638044791588    7.67     4 0.713 Y     pass        
    ##  33 8.55267621157432    9.91     4 0.875 T     pass        
    ##  34 5.19424533253502   12.5      9 0.475 D     pass        
    ##  35 2.38403395054751   14.2      3 0.577 Y     pass        
    ##  36 5.67464655382563    8.92     3 0.34  O     pass        
    ##  37 2.14496115263483   14.2      4 0.196 X     pass        
    ##  38 5.60984423093511    6.06     1 0.876 W     pass        
    ##  39 4.89207072827848    9.48    -1 0.455 W     fail        
    ##  40 0.632357402546965   8.06     4 0.653 A     pass        
    ##  41 5.33157193132959   12.0      3 0.19  N     pass        
    ##  42 10.1216250585273   10.7      2 0.798 X     pass        
    ##  43 3.76941578256625    5.78     2 0.354 Z     pass        
    ##  44 5.78508515486967   12.7      2 0.36  P     pass        
    ##  45 4.25859267260967    7.88     2 0.159 H     pass        
    ##  46 1.41986754185983    7.53     4 0.256 M     pass        
    ##  47 5.67229130856473   12.9      3 0.634 J     pass        
    ##  48 5.28364840494448    6.36     4 0.546 V     pass        
    ##  49 3.25115539733362    8.55     3 0.94  O     pass        
    ##  50 5.64882974051551   10.5      4 0.389 P     pass        
    ##  51 8.51829254275053   11.2      3 0.431 J     pass        
    ##  52 8.18713025588171   10.7      4 0.603 L     pass        
    ##  53 1.82602922560656    9.71     1 0.893 T     pass        
    ##  54 2.15510387792325   10.0      7 0.894 V     pass        
    ##  55 5.12178248194515    7.50     1 0.168 J     pass        
    ##  56 6.11658106868716   12.5      3 0.601 X     pass        
    ##  57 3.55763457548196    9.50     4 0.295 X     pass        
    ##  58 3.50362078053313    9.56     4 0.907 G     pass        
    ##  59 5.29564701499441   11.0      5 0.501 S     pass        
    ##  60 4.03683694831384   11.5      3 0.451 C     pass        
    ##  61 3.97637450547168    6.01     2 0.62  I     pass        
    ##  62 4.70791423964619   11.5      3 0.142 E     pass        
    ##  63 8.22404954921323   12.0      3 0.719 E     pass        
    ##  64 1.82130751076994   10.8      2 0.039 Y     pass        
    ##  65 1.90589898654719   12.4      3 0.721 O     pass        
    ##  66 7.23914513824857    2.29     2 0.666 G     pass        
    ##  67 4.52209718815851   13.5      1 0.975 X     pass        
    ##  68 8.06513799710857    7.94     4 0.766 D     pass        
    ##  69 4.65005384515553   12.7      2 0.29  B     pass        
    ##  70 4.89621062500447    7.39     3 0.859 C     pass        
    ##  71 2.14888291139881    9.37     5 0.311 J     pass        
    ##  72 6.50038191588745    8.88     3 0.018 C     pass        
    ##  73 6.44466435479977   11.2      5 0.905 S     pass        
    ##  74 4.8625727284113    12.9      3 0.354 F     pass        
    ##  75 5.83099046467138    9.45     4 0.198 I     pass        
    ##  76 5.50889343936521   17.7      3 0.19  E     pass        
    ##  77 1.58969650502613    7.87     4 0.27  O     pass        
    ##  78 5.90090023008083    6.08     4 0.897 T     pass        
    ##  79 7.22895777236216   10.8      2 0.148 Q     pass        
    ##  80 2.93411041820239    7.96     2 0.422 A     pass        
    ##  81 7.51380609413252   12.2      4 0.237 B     pass        
    ##  82 5.4343103138763    13.9      1 0.838 N     pass        
    ##  83 5.12617390086516    7.52     4 0.27  X     pass        
    ##  84 5.46225756047434   14.4      3 0.969 F     pass        
    ##  85 2.19200184714283    7.10     4 0.773 Q     pass        
    ##  86 6.2294347683656    12.3      2 0.578 Y     pass        
    ##  87 5.26888170388563O  10.6      5 0.826 N     pass        
    ##  88 5.87084810783115    9.83     3 0.763 F     pass        
    ##  89 5.14661469190673    7.78     1 0.357 I     pass        
    ##  90 4.57180581775083   11.7      2 1.1   H     fail        
    ##  91 4.78813506802388   11.1      2 0.973 P     pass        
    ##  92 3.92281156506594    7.81     6 0.028 U     pass        
    ##  93 6.55649122561405   14.0      6 0.07  N     pass        
    ##  94 3.93279755974024   16.3      3 0.874 N     pass        
    ##  95 5.81413867091296   10.8      2 0.853 G     pass        
    ##  96 5.02683477650319   11.3      5 0.216 Z     pass        
    ##  97 5.36767552401918   12.5      2 0.084 C     pass        
    ##  98 4.67378177465842   11.0      2 0.089 V     pass        
    ##  99 6.72951193300646   12.1      2 0.76  T     pass        
    ## 100 4.76321235309505    9.35     3 0.104 U     pass
