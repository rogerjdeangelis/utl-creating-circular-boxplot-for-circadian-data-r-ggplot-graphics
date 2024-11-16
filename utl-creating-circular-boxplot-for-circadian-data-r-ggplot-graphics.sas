%let pgm=utl-creating-circular-boxplot-for-circadian-data-r-ggplot-graphics;

Creating circular boxplot for circadian data r ggplot graphics

github graph                                                                                                                     
https://tinyurl.com/yrd47484                                                                                                 
https://github.com/rogerjdeangelis/utl-creating-circular-boxplot-for-circadian-data-r-ggplot-graphics/blob/main/circlebox.png

github
https://tinyurl.com/4whbjwjp
https://github.com/rogerjdeangelis/utl-creating-circular-boxplot-for-circadian-data-r-ggplot-graphics

Stackoverflow R
https://tinyurl.com/2nrbksw6
https://stackoverflow.com/questions/77891398/creating-circular-boxplot-for-circadian-data

    CONTENTS

       1 r gglot
       2 related repos

I think you have to convert the r dataframe from sas to a S3 tibble.
Hard to keep track of all the data structures in R.

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/************************************************************************************************************************************/
/*                           |                                            |                                                         */
/*                           |                                            |                                                         */
/*            INPUT          |           PROCESS                          |                         OUTPUT                          */
/*                           |                                            |                                                         */
/* options                   |                                            |                                                         */
/*  validvarname=upcase;     | have<-read_sas("d:/sd1/have.sas7bdat")     |                                                         */
/* libname sd1 "d:/sd1";     | have <- as_tibble(have)                    |                         MIDNIGHT                        */
/* data sd1.have;            | str(have)                                  |                                                         */
/*  input sample $3.         | png(file="d:/png/circlebox.png"            |                     ***************                     */
/*        process & $9. ct;  |   ,width=640,height=640)                   |                 *****      |      *****                 */
/*                           | have %>%                                   |              ****          |          ****              */
/* cards4;                   |   ggplot(aes(as.numeric(factor(PROCESS))   |            ***             |             ***            */
/* BAT  CellCycle    1.14013 |       ,CT, fill = PROCESS)) +              |          ***               |               ***          */
/* BAT  CellCycle    3.10652 |   geom_vline(xintercept = 1:3              |         **          ***************          **         */
/* BAT  CellCycle    3.73811 |   ,linewidth = 7, color = 'gray92') +      |        **        ****    +--|--+  ****        **        */
/* BAT  CellCycle   -0.55088 |   stat_boxplot(geom = 'errorbar'           |       **       ***   |---|  |  |-|   ***       **       */
/* BAT  CellCycle   -0.50256 |    ,width = 0.6, aes(color = PROCESS)) +   |      **       **         +-----+       **    __  **     */
/* BAT  CellCycle   -0.48578 |   geom_boxplot(width = 0.6                 |     **      ***            |           ***   \  **      */
/* BAT  CellCycle   -0.66959 |     ,linewidth = 0, outlier.colour = NA) + |     *       *              |              *    \  **    */
/* BAT  CellCycle   -1.80344 |   stat_boxplot(geom = 'errorbar'           |    *       **              |               *  +--+ *    */
/* BAT  CellCycle   -1.15817 |    ,width = 0.6,                           |    *      **               |               ** |  | *    */
/* BAT  ECM         -1.95850 |    aes(ymax = after_stat(middle)           |   **      *                |                * |--| **   */
/* BAT  ECM         -0.54473 |      ,ymin = after_stat(middle))) +        | 6 *      **                |                **|  |  *6  */
/* BAT  ECM         -0.63197 |   geom_hline(yintercept =                  | p *------*----------------BAT----------------* +-+  *a  */
/* BAT  ECM         -0.59311 |    c(-12,-8,-4,0,4,8), linetype = 5,       | m *      *                 |                 *  \   *m  */
/* BAT  ECM          1.73207 |    alpha = 0.2) +                          |   *      *                 |                 *  --  *   */
/* BAT  ECM          1.52978 |   annotate('rect', xmax = -2               |   *      **                |                **      *   */
/* BAT  ECM         -3.70622 |    ,xmin = -Inf, ymin = -Inf, ymax = Inf,  |   **      *                |                *      **   */
/* BAT  Energy       2.19648 |    fill = 'white') +                       |    *      **               |               **      *    */
/* BAT  Energy       4.17777 |   annotate('text', x = -4, y = 0           |    **      **              |               *       *    */
/* BAT  Energy       2.62494 |    ,label='BAT',fontface = 2, size = 4) +  |     *       *              |              *       *     */
/* BAT  Energy       1.63308 |   coord_polar(theta = 'y', start = pi) +   |     **       **            |            **       **     */
/* BAT  Energy       2.25815 |   theme_void() +                           |      **       **           |           **       **      */
/* BAT  Energy      -1.47472 |   scale_x_continuous(limit =c(-4, 3.3)) +  |       **       ***         |         ***       **       */
/* BAT  Energy      -2.15582 |   scale_y_continuous(limits = c(-12,12)    |        **        ****      |     ****        **         */
/* BAT  Energy       1.44485 |    ,breaks = -12:11,                       |         **          ***************          **         */
/* BAT  Energy       1.71032 |    labels = ~sprintf('%02d:00'             |           **                               ***          */
/* BAT  Energy       1.72140 |    ,ifelse(.x < 0, .x + 24,.x))) +         |            ***                           ***            */
/* BAT  Energy       5.07008 |   theme(axis.text.x = element_text(),      |              ****                     ****              */
/* BAT  Energy       3.25212 |    legend.position = 'top') +              |                 *****             *****                 */
/* BAT  Energy      -4.30716 |   scale_color_manual(values =              |                     ***************                     */
/* BAT  Energy       2.52154 |     c('#ca6c28', '#aa2a25', '#538335')) +  |                           NOON                          */
/* BAT  Energy       2.30962 |   scale_fill_manual(values =               |                                                         */
/* BAT  Energy       1.97906 |     c('#ca6c28', '#aa2a25', '#538335'))    |                                                         */
/* BAT  Energy       1.74733 | png();                                     |                                                         */
/* BAT  Energy       1.62000 |                                            |                                                         */
/* BAT  Energy       4.51254 |                                            |                                                         */
/* BAT  Energy      -4.51495 |                                            |                                                         */
/* BAT  Energy       3.96613 |                                            |                                                         */
/* ;;;;                      |                                            |                                                         */
/* run;quit                  |                                            |                                                         */
/*                           |                                            |                                                         */
/************************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options
 validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have;
 input sample $3.
       process & $9. ct;

cards4;
BAT  CellCycle    1.14013
BAT  CellCycle    3.10652
BAT  CellCycle    3.73811
BAT  CellCycle   -0.55088
BAT  CellCycle   -0.50256
BAT  CellCycle   -0.48578
BAT  CellCycle   -0.66959
BAT  CellCycle   -1.80344
BAT  CellCycle   -1.15817
BAT  ECM         -1.95850
BAT  ECM         -0.54473
BAT  ECM         -0.63197
BAT  ECM         -0.59311
BAT  ECM          1.73207
BAT  ECM          1.52978
BAT  ECM         -3.70622
BAT  Energy       2.19648
BAT  Energy       4.17777
BAT  Energy       2.62494
BAT  Energy       1.63308
BAT  Energy       2.25815
BAT  Energy      -1.47472
BAT  Energy      -2.15582
BAT  Energy       1.44485
BAT  Energy       1.71032
BAT  Energy       1.72140
BAT  Energy       5.07008
BAT  Energy       3.25212
BAT  Energy      -4.30716
BAT  Energy       2.52154
BAT  Energy       2.30962
BAT  Energy       1.97906
BAT  Energy       1.74733
BAT  Energy       1.62000
BAT  Energy       4.51254
BAT  Energy      -4.51495
BAT  Energy       3.96613
;;;;
run;quit

options ps=38;
PROC UNIVARIATE DATA=sd1.have PLOT;
  VAR ct;
  BY process;
RUN;

/**************************************************************************************************************************/
/*                                                                                                                        */
/* SD1.HAVE total obs=37                                                                                                  */
/*                                                                                                                        */
/* Obs    SAMPLE    PROCESS         CT              CellCycle        ECM      Energy                                      */
/*                                                 ------+-----------+-----------+------                                  */
/*   1     BAT      CellCycle     1.14013         |                                    |                                  */
/*   2     BAT      CellCycle     3.10652       6 +                                    +  6                               */
/*   3     BAT      CellCycle     3.73811         |                                    |                                  */
/*   4     BAT      CellCycle    -0.55088         |                              0     |                                  */
/*   5     BAT      CellCycle    -0.50256         |                              0     |                                  */
/*   6     BAT      CellCycle    -0.48578       4 +                              0     +  4                               */
/*   7     BAT      CellCycle    -0.66959         |      |                       |     |                                  */
/*   8     BAT      CellCycle    -1.80344         |      |                       |     |                                  */
/*   9     BAT      CellCycle    -1.15817         |      |                    +-----+  |                                  */
/*  10     BAT      ECM          -1.95850       2 +      |                    *-----*  +  2                               */
/*  11     BAT      ECM          -0.54473         |      |        +-----+     +--+--+  |                                  */
/*  12     BAT      ECM          -0.63197         |   +-----+     |     |              |                                  */
/*  13     BAT      ECM          -0.59311         |   |  +  |     |     |              |                                  */
/*  14     BAT      ECM           1.73207       0 +   |     |     |     |              +  0                               */
/*  15     BAT      ECM           1.52978         |   *-----*     *--+--*              |                                  */
/*  16     BAT      ECM          -3.70622         |      |        |     |              |                                  */
/*  17     BAT      Energy        2.19648         |      |        |     |        *     |                                  */
/*  18     BAT      Energy        4.17777      -2 +      |        +-----+        *     + -2                               */
/*  19     BAT      Energy        2.62494         |                  |                 |                                  */
/*  20     BAT      Energy        1.63308         |                  |                 |                                  */
/*  21     BAT      Energy        2.25815         |                  |                 |                                  */
/*  22     BAT      Energy       -1.47472      -4 +                                    + -4                               */
/*  23     BAT      Energy       -2.15582         |                              *     |                                  */
/*  24     BAT      Energy        1.44485         |                                    |                                  */
/*  25     BAT      Energy        1.71032         |                                    |                                  */
/*  26     BAT      Energy        1.72140      -6 +                                    + -6                               */
/*  27     BAT      Energy        5.07008          ------+-----------+-----------+-------                                 */
/*  28     BAT      Energy        3.25212      SS    CellCycle        ECM      Energy                                     */
/*  29     BAT      Energy       -4.30716                                                                                 */
/*  30     BAT      Energy        2.52154                                                                                 */
/*  31     BAT      Energy        2.30962                                                                                 */
/*  32     BAT      Energy        1.97906                                                                                 */
/*  33     BAT      Energy        1.74733                                                                                 */
/*  34     BAT      Energy        1.62000                                                                                 */
/*  35     BAT      Energy        4.51254                                                                                 */
/*  36     BAT      Energy       -4.51495                                                                                 */
/*  37     BAT      Energy        3.96613                                                                                 */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/


%utl_fkil("d:/png/circlebox.png");

%utl_rbeginx;
parmcards4;
library(haven)
library(tibble)
library(ggplot2)
source("c:/oto/fn_tosas9x.R")
have<-read_sas("d:/sd1/have.sas7bdat")
have <- as_tibble(have)
str(have)
png(file="d:/png/circlebox.png"
  ,width=640,height=640)
have %>%
  ggplot(aes(as.numeric(factor(PROCESS))
      ,CT, fill = PROCESS)) +
  geom_vline(xintercept = 1:3
  ,linewidth = 7, color = 'gray92') +
  stat_boxplot(geom = 'errorbar'
   ,width = 0.6, aes(color = PROCESS)) +
  geom_boxplot(width = 0.6
    ,linewidth = 0, outlier.colour = NA) +
  stat_boxplot(geom = 'errorbar'
   ,width = 0.6,
   aes(ymax = after_stat(middle)
     ,ymin = after_stat(middle))) +
  geom_hline(yintercept =
   c(-12,-8,-4,0,4,8), linetype = 5,
   alpha = 0.2) +
  annotate('rect', xmax = -2
   ,xmin = -Inf, ymin = -Inf, ymax = Inf,
   fill = 'white') +
  annotate('text', x = -4, y = 0
   ,label='BAT',fontface = 2, size = 4) +
  coord_polar(theta = 'y', start = pi) +
  theme_void() +
  scale_x_continuous(limit =c(-4, 3.3)) +
  scale_y_continuous(limits = c(-12,12)
   ,breaks = -12:11,
   labels = ~sprintf('%02d:00'
   ,ifelse(.x < 0, .x + 24,.x))) +
  theme(axis.text.x = element_text(),
   legend.position = 'top') +
  scale_color_manual(values =
    c('#ca6c28', '#aa2a25', '#538335')) +
  scale_fill_manual(values =
    c('#ca6c28', '#aa2a25', '#538335'))
png();
;;;;
%utl_rendx;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*                               MIDNIGHT                                                                                 */
/*                                                                                                                        */
/*                           ***************                                                                              */
/*                       *****      |      *****                                                                          */
/*                    ****          |          ****                                                                       */
/*                  ***             |             ***                                                                     */
/*                ***               |               ***                                                                   */
/*               **          ***************          **                                                                  */
/*              **        ****    +--|--+  ****        **                                                                 */
/*             **       ***   |---|  +  |-|   ***       **                                                                */
/*            **       **         +-----+       **    __  **                                                              */
/*           **      ***            |           ***   \  **                                                               */
/*           *       *              |              *    \  **                                                             */
/*          *       **              |               *  +--+ *                                                             */
/*          *      **               |               ** |  | *                                                             */
/*         **      *                |                * |+ | **                                                            */
/*         *      **                |                **|  |  *                                                            */
/*   6 PM  *------*----------------BAT----------------* +-+  * 6 AM                                                       */
/*         *      *                 |                 *  \   *                                                            */
/*         *      *                 |                 *  --  *                                                            */
/*         *      **                |                **      *                                                            */
/*         **      *                |                *      **                                                            */
/*          *      **               |               **      *                                                             */
/*          **      **              |               *       *                                                             */
/*           *       *              |              *       *                                                              */
/*           **       **            |            **       **                                                              */
/*            **       **           |           **       **                                                               */
/*             **       ***         |         ***       **                                                                */
/*              **        ****      |     ****        **                                                                  */
/*               **          ***************          **                                                                  */
/*                 **                               ***                                                                   */
/*                  ***                           ***                                                                     */
/*                    ****                     ****                                                                       */
/*                       *****             *****                                                                          */
/*                           ***************                                                                              */
/*                               NOON                                                                                     */
/*                                                                                                                        */
/**************************************************************************************************************************/

REPO
---------------------------------------------------------------------------------------------------------------------------------------
https://github.com/rogerjdeangelis/utl-adding-text-to-an-existing-png-graphic-python-AI
https://github.com/rogerjdeangelis/utl-changepoint-like-analysis-in-R-and-SAS-elbow-graph
https://github.com/rogerjdeangelis/utl-classic-sas-and-well-designed-tables-and-ascii-graphics-instead-of-bling
https://github.com/rogerjdeangelis/utl-color-a-region-under-a-distribution-curve-graph-wps-and-wps-r
https://github.com/rogerjdeangelis/utl-count-of-three-word-phrases-in-a-paragraph-ngrams-nlp
https://github.com/rogerjdeangelis/utl-Create-a-side-by-side-table-and-graph-using-greplay
https://github.com/rogerjdeangelis/utl-create-graphs-in-excel-using-excel-chart-templates
https://github.com/rogerjdeangelis/utl-creating-a-raincloud-plot-graph-using-r
https://github.com/rogerjdeangelis/utl-dygraph-javascript-library-from-MIT
https://github.com/rogerjdeangelis/utl-excel-report-with-two-side-by-side-graphs-below_python
https://github.com/rogerjdeangelis/utl-Graph-with-known-intercept-and-slope
https://github.com/rogerjdeangelis/utl-graphics-boxplots-with-jiggled-point-values-alongside
https://github.com/rogerjdeangelis/utl-Graphics-Surveying-ten-random-locations-in-North-Carolina-using-superinposed-grid
https://github.com/rogerjdeangelis/utl-greatly-underrated-ascii-graphics-visualizing-cross-tabulations
https://github.com/rogerjdeangelis/utl-how-many-triangles-in-the-polygon-r-igraph-AI
https://github.com/rogerjdeangelis/utl-identical-side-by-side-text-and-graphics-in-pdf-and-powerpoint
https://github.com/rogerjdeangelis/utl-identify-linked-and-unliked-paths-r-igraph
https://github.com/rogerjdeangelis/utl-igraph-find-largest-group-of-unrelated-individuals-in-your-family-reunion
https://github.com/rogerjdeangelis/utl-linking-connected-nodes-in-a-network-graph-r-igraph
https://github.com/rogerjdeangelis/utl-quality-graphics-in-R-wps-and-sas
https://github.com/rogerjdeangelis/utl-R-AI-igraph-list-connections-in-a-non-directed-graph-for-a-subset-of-vertices
https://github.com/rogerjdeangelis/utl-r-graphics-vs-wps-base-graphics-layering-in-r-versus-procs-in-wps-base-ggplot2
https://github.com/rogerjdeangelis/utl-sas-ods-excel-to-create-excel-report-and-separate-png-graph-finally-r-for-layout-in-excel
https://github.com/rogerjdeangelis/utl-shortest-and-longest-travel-time-from-home-to-work-igraph-AI
https://github.com/rogerjdeangelis/utl-three-heat-maps-of-bivariate-normal-wps-r-graph-plot
https://github.com/rogerjdeangelis/utl-under-used-proc-calendar-ascii-graphics
https://github.com/rogerjdeangelis/utl-web-html-graphics-and-charts-with-free-r-googlevis-package
https://github.com/rogerjdeangelis/utl_adding_SAS_graphics_at_an_arbitrary_position_into_existing_excel_sheets
https://github.com/rogerjdeangelis/utl_classic_sas_graph_greplay_harvard_macro_multiple_plots_per_page
https://github.com/rogerjdeangelis/utl_classic_sas_graph_three_plots_across_many_methods_long_live
https://github.com/rogerjdeangelis/utl_custom_graphics_in_R
https://github.com/rogerjdeangelis/utl_fun_with_line_printer_graphics_editor
https://github.com/rogerjdeangelis/utl_graphics_589_SAS_and_R_graphics_with_code_and_datasets
https://github.com/rogerjdeangelis/utl_graphics_determine_us_state_from_latitude_and_longitude
https://github.com/rogerjdeangelis/utl_graphics_fit_a_smooth_line_to_a_scatter_plot_loess
https://github.com/rogerjdeangelis/utl_graphics_flexibility_of_ascii_bar_charts
https://github.com/rogerjdeangelis/utl_graphics_plotting_rivers_in_brazil_using_sharpefiles
https://github.com/rogerjdeangelis/utl_graphics_zipcode_boundary_maps
https://github.com/rogerjdeangelis/utl_graph_visualize_crosstab
https://github.com/rogerjdeangelis/utl_how_to_stack_a_table_and_corresponding_bar_graph
https://github.com/rogerjdeangelis/utl_javascript_and_classic_map_graphics_with_mouseovers_and_multiple_drilldowns
https://github.com/rogerjdeangelis/utl_javascript_dygraph_graphics_multipanel_time_series
https://github.com/rogerjdeangelis/utl_pdf_graphics_top_40_a_sas_ods_graphics_look_at_chicago_public_schools_salaries_by_job
https://github.com/rogerjdeangelis/utl_polar_graphics_pot_violin_plot
https://github.com/rogerjdeangelis/utl_proc_gmap_classic_graphics_grid_containing_four_states
https://github.com/rogerjdeangelis/utl_remove_isolated_nodes_from_an_network_r_igraph
https://github.com/rogerjdeangelis/utl_R_graphics_polar_plot
https://github.com/rogerjdeangelis/utl_r_graphics_visualizing_assciation_amoung_many_variables
https://github.com/rogerjdeangelis/utl_sas_classic_graphics_15_plots_on_a_page
https://github.com/rogerjdeangelis/utl_sas_classic_graphics_designing_your_greplay_template
https://github.com/rogerjdeangelis/utl_sas_classic_graphics_grid_of__proc_univariate_histograms
https://github.com/rogerjdeangelis/utl_sas_classic_graphs_using_phil_mason_grid_macro_for_layout
https://github.com/rogerjdeangelis/utl_table_graph_ppt
https://github.com/rogerjdeangelis/utl_wps_sas_classic_graphics_optimum_minimums_maximums_increments_for-axes


/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
