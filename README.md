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
more](https://rich-iannone.github.io/pointblank/articles/VALID-I.html):

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

<div id="pb_agent" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>@import url("https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");
@import url("https://unpkg.com/balloon-css/balloon.min.css");
html {
  font-family: 'IBM Plex Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#pb_agent .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 90%;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#pb_agent .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#pb_agent .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#pb_agent .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#pb_agent .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#pb_agent .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#pb_agent .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#pb_agent .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#pb_agent .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#pb_agent .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#pb_agent .gt_from_md > :first-child {
  margin-top: 0;
}

#pb_agent .gt_from_md > :last-child {
  margin-bottom: 0;
}

#pb_agent .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#pb_agent .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#pb_agent .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#pb_agent .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#pb_agent .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#pb_agent .gt_left {
  text-align: left;
}

#pb_agent .gt_center {
  text-align: center;
}

#pb_agent .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#pb_agent .gt_font_normal {
  font-weight: normal;
}

#pb_agent .gt_font_bold {
  font-weight: bold;
}

#pb_agent .gt_font_italic {
  font-style: italic;
}

#pb_agent .gt_super {
  font-size: 65%;
}

#pb_agent .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}

#pb_agent {
  -webkit-font-smoothing: antialiased;
}

#pb_agent .gt_row {
  overflow: visible;
}

#pb_agent .gt_sourcenote {
  height: 35px;
  padding: 0;
}

#pb_agent code {
  font-family: 'IBM Plex Mono', monospace, courier;
  background-color: transparent;
  padding: 0;
}
</style>
<table class="gt_table" style="table-layout: fixed;; width: 0px">
  <colgroup>
    <col style="width:6px;"/>
    <col style="width:35px;"/>
    <col style="width:190px;"/>
    <col style="width:120px;"/>
    <col style="width:120px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:65px;"/>
  </colgroup>
  <thead class="gt_header">
    <tr>
      <th colspan="14" class="gt_heading gt_title gt_font_normal" style="color: #444444; font-size: 28px; text-align: left; font-weight: 500;">Pointblank Validation</th>
    </tr>
    <tr>
      <th colspan="14" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="font-size: 12px; text-align: left;"><span style="text-decoration-style:solid;text-decoration-color:#ADD8E6;text-decoration-line:underline;text-underline-position:under;color:#333333;font-variant-numeric:tabular-nums;padding-left:4px;margin-right:5px;padding-right:2px;">Data Validation Demo</span></p>
<div style="height:25px;"><span style="background-color:#F1D35A;color:#222222;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 5px;font-weight:bold;border:solid 1px #F1D35A;padding:2px 15px 2px 15px;font-size:smaller;">tibble</span>
<span style="background-color:none;color:#222222;padding:0.5em 0.5em;position:inherit;margin:5px 10px 5px -4px;font-weight:bold;border:solid 1px #F1D35A;padding:2px 15px 2px 15px;font-size:smaller;">my_data</span><span style="background-color:#E5AB00;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 5px;font-weight:bold;border:solid 1px #E5AB00;padding:2px 15px 2px 15px;font-size:smaller;">WARN</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #E5AB00;padding:2px 15px 2px 15px;font-size:smaller;">0.01</span>
<span style="background-color:#D0182F;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 1px;font-weight:bold;border:solid 1px #D0182F;padding:2px 15px 2px 15px;font-size:smaller;">STOP</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #D0182F;padding:2px 15px 2px 15px;font-size:smaller;">0.02</span>
<span style="background-color:#499FFE;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 1px;font-weight:bold;border:solid 1px #499FFE;padding:2px 15px 2px 15px;font-size:smaller;">NOTIFY</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #499FFE;padding:2px 15px 2px 15px;font-size:smaller;">&mdash;</span></div>
</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;"></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;"></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">STEP</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">COLUMNS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">VALUES</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">TBL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">EVAL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">UNITS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">PASS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">FAIL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">W</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">S</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">N</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">EXT</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left" style="background-color: #4CA64C; height:  40px"></td>
<td class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height:  40px">1</td>
<td class="gt_row gt_left" style="height:  40px"><div class='gt_from_md'><div aria-label="Expect that column `weight` is of type: numeric. " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <defs></defs>    <g id="pointblank" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_is_numeric" transform="translate(-0.397206, 0.359210)">            <path d="M65.712234,65.0146694 L65.712234,10.0146694 C65.712234,5.0441066 61.6827967,1.01466935 56.712234,1.01466935 L10.712234,1.01466935 C5.74167122,1.01466935 1.71223397,5.0441066 1.71223397,10.0146694 L1.71223397,56.0146694 C1.71223397,60.9852321 5.74167122,65.0146694 10.712234,65.0146694 L65.712234,65.0146694 Z" id="rectangle" stroke="#000000" stroke-width="2"></path>            <rect id="column" fill="#000000" x="12.2117153" y="12.0146694" width="20" height="42" rx="1"></rect>            <text id="d" font-family="LucidaGrande, Lucida Grande" font-size="26" font-weight="normal" fill="#000000">                <tspan x="38.4461294" y="43.0146694">d</tspan>            </text>        </g>    </g></svg></div>
  <code style="font-size:11px;">&nbsp;col_is_numeric()</code>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="weight" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>weight</code>
  </p>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px">&mdash;</td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td class="gt_row gt_right" style="font-size: 11px; height:  40px"><code>1</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>1</code><br><code>1.00</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>0</code><br><code>0.00</code></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="color: #E5AB00;">○</span></p>
</div></td>
<td class="gt_row gt_center" style="background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="height:  40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td class="gt_row gt_left" style="background-color: #CF142B; height:  40px"></td>
<td class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height:  40px">2</td>
<td class="gt_row gt_left" style="height:  40px"><div class='gt_from_md'><div aria-label="Expect that column `length` is of type: numeric. " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <defs></defs>    <g id="pointblank" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_is_numeric" transform="translate(-0.397206, 0.359210)">            <path d="M65.712234,65.0146694 L65.712234,10.0146694 C65.712234,5.0441066 61.6827967,1.01466935 56.712234,1.01466935 L10.712234,1.01466935 C5.74167122,1.01466935 1.71223397,5.0441066 1.71223397,10.0146694 L1.71223397,56.0146694 C1.71223397,60.9852321 5.74167122,65.0146694 10.712234,65.0146694 L65.712234,65.0146694 Z" id="rectangle" stroke="#000000" stroke-width="2"></path>            <rect id="column" fill="#000000" x="12.2117153" y="12.0146694" width="20" height="42" rx="1"></rect>            <text id="d" font-family="LucidaGrande, Lucida Grande" font-size="26" font-weight="normal" fill="#000000">                <tspan x="38.4461294" y="43.0146694">d</tspan>            </text>        </g>    </g></svg></div>
  <code style="font-size:11px;">&nbsp;col_is_numeric()</code>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="length" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>length</code>
  </p>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px">&mdash;</td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td class="gt_row gt_right" style="font-size: 11px; height:  40px"><code>1</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>0</code><br><code>0.00</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>1</code><br><code>1.00</code></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="color: #E5AB00;">●</span></p>
</div></td>
<td class="gt_row gt_center" style="background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="color: #CF142B;">●</span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="height:  40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td class="gt_row gt_left" style="background-color: #CF142B; height:  40px"></td>
<td class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height:  40px">3</td>
<td class="gt_row gt_left" style="height:  40px"><div class='gt_from_md'><div aria-label="Expect that column `prop` is of type: numeric. " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <defs></defs>    <g id="pointblank" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_is_numeric" transform="translate(-0.397206, 0.359210)">            <path d="M65.712234,65.0146694 L65.712234,10.0146694 C65.712234,5.0441066 61.6827967,1.01466935 56.712234,1.01466935 L10.712234,1.01466935 C5.74167122,1.01466935 1.71223397,5.0441066 1.71223397,10.0146694 L1.71223397,56.0146694 C1.71223397,60.9852321 5.74167122,65.0146694 10.712234,65.0146694 L65.712234,65.0146694 Z" id="rectangle" stroke="#000000" stroke-width="2"></path>            <rect id="column" fill="#000000" x="12.2117153" y="12.0146694" width="20" height="42" rx="1"></rect>            <text id="d" font-family="LucidaGrande, Lucida Grande" font-size="26" font-weight="normal" fill="#000000">                <tspan x="38.4461294" y="43.0146694">d</tspan>            </text>        </g>    </g></svg></div>
  <code style="font-size:11px;">&nbsp;col_is_numeric()</code>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="prop" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>prop</code>
  </p>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px">&mdash;</td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td class="gt_row gt_right" style="font-size: 11px; height:  40px"><code>1</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>0</code><br><code>0.00</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>1</code><br><code>1.00</code></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="color: #E5AB00;">●</span></p>
</div></td>
<td class="gt_row gt_center" style="background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="color: #CF142B;">●</span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="height:  40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td class="gt_row gt_left" style="background-color: #CF142B; height:  40px"></td>
<td class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height:  40px">4</td>
<td class="gt_row gt_left" style="height:  40px"><div class='gt_from_md'><div aria-label="Expect that column `count` is of type: integer. " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <defs>        <path d="M10.712234,0.014669353 L56.712234,0.014669353 C62.2350815,0.014669353 66.712234,4.49182185 66.712234,10.0146694 L66.712234,66.0146694 L10.712234,66.0146694 C5.18938647,66.0146694 0.712233968,61.5375169 0.712233968,56.0146694 L0.712233968,10.0146694 C0.712233968,4.49182185 5.18938647,0.014669353 10.712234,0.014669353 Z" id="path-1"></path>    </defs>    <g id="pointblank" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_is_integer" transform="translate(-0.397206, 0.726017)">            <g id="rectangle">                <use fill="#FFFFFF" fill-rule="evenodd" xlink:href="#path-1"></use>                <path stroke="#000000" stroke-width="2" d="M65.712234,65.0146694 L65.712234,10.0146694 C65.712234,5.0441066 61.6827967,1.01466935 56.712234,1.01466935 L10.712234,1.01466935 C5.74167122,1.01466935 1.71223397,5.0441066 1.71223397,10.0146694 L1.71223397,56.0146694 C1.71223397,60.9852321 5.74167122,65.0146694 10.712234,65.0146694 L65.712234,65.0146694 Z"></path>            </g>            <rect id="column" fill="#000000" x="12.2117153" y="12.0146694" width="20" height="42" rx="1"></rect>            <text id="i" font-family="LucidaGrande, Lucida Grande" font-size="26" font-weight="normal" fill="#000000">                <tspan x="42.8704458" y="43.0146694">i</tspan>            </text>        </g>    </g></svg></div>
  <code style="font-size:11px;">&nbsp;col_is_integer()</code>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="count" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>count</code>
  </p>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px">&mdash;</td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td class="gt_row gt_right" style="font-size: 11px; height:  40px"><code>1</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>0</code><br><code>0.00</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>1</code><br><code>1.00</code></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="color: #E5AB00;">●</span></p>
</div></td>
<td class="gt_row gt_center" style="background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="color: #CF142B;">●</span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="height:  40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td class="gt_row gt_left" style="background-color: #4CA64C; height:  40px"></td>
<td class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height:  40px">5</td>
<td class="gt_row gt_left" style="height:  40px"><div class='gt_from_md'><div aria-label="Expect that column `group` is of type: character. " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <defs>        <path d="M10.712234,0.014669353 L56.712234,0.014669353 C62.2350815,0.014669353 66.712234,4.49182185 66.712234,10.0146694 L66.712234,66.0146694 L10.712234,66.0146694 C5.18938647,66.0146694 0.712233968,61.5375169 0.712233968,56.0146694 L0.712233968,10.0146694 C0.712233968,4.49182185 5.18938647,0.014669353 10.712234,0.014669353 Z" id="path-1"></path>    </defs>    <g id="pointblank" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_is_character" transform="translate(-0.397206, 0.151308)">            <g id="rectangle">                <use fill="#FFFFFF" fill-rule="evenodd" xlink:href="#path-1"></use>                <path stroke="#000000" stroke-width="2" d="M65.712234,65.0146694 L65.712234,10.0146694 C65.712234,5.0441066 61.6827967,1.01466935 56.712234,1.01466935 L10.712234,1.01466935 C5.74167122,1.01466935 1.71223397,5.0441066 1.71223397,10.0146694 L1.71223397,56.0146694 C1.71223397,60.9852321 5.74167122,65.0146694 10.712234,65.0146694 L65.712234,65.0146694 Z"></path>            </g>            <rect id="column" fill="#000000" x="12.2117153" y="12.0146694" width="20" height="42" rx="1"></rect>            <text id="c" font-family="LucidaGrande, Lucida Grande" font-size="26" font-weight="normal" fill="#000000">                <tspan x="39.9695669" y="43.0146694">c</tspan>            </text>        </g>    </g></svg></div>
  <code style="font-size:10px;">&nbsp;col_is_character()</code>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="group" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>group</code>
  </p>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px">&mdash;</td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td class="gt_row gt_right" style="font-size: 11px; height:  40px"><code>1</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>1</code><br><code>1.00</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>0</code><br><code>0.00</code></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="color: #E5AB00;">○</span></p>
</div></td>
<td class="gt_row gt_center" style="background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="height:  40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td class="gt_row gt_left" style="background-color: #FFBF00; height:  40px"></td>
<td class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height:  40px">6</td>
<td class="gt_row gt_left" style="height:  40px"><div class='gt_from_md'><div aria-label="Expect that values in `count` should be &gt;= `0`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><svg width="30px" height="30px" viewBox="0 0 67 66" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <defs>        <path d="M10.712234,0 L56.712234,0 C62.2350815,-1.01453063e-15 66.712234,4.4771525 66.712234,10 L66.712234,66 L10.712234,66 C5.18938647,66 0.712233968,61.5228475 0.712233968,56 L0.712233968,10 C0.712233968,4.4771525 5.18938647,1.01453063e-15 10.712234,0 Z" id="path-1"></path>    </defs>    <g id="pointblank" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_gte" transform="translate(-0.029895, -0.002188)">            <g id="rectangle">                <use fill="#FFFFFF" fill-rule="evenodd" xlink:href="#path-1"></use>                <path stroke="#000000" stroke-width="2" d="M65.712234,65 L65.712234,10 C65.712234,5.02943725 61.6827967,1 56.712234,1 L10.712234,1 C5.74167122,1 1.71223397,5.02943725 1.71223397,10 L1.71223397,56 C1.71223397,60.9705627 5.74167122,65 10.712234,65 L65.712234,65 Z"></path>            </g>            <path d="M49.712234,12 L17.712234,12 C14.952234,12 12.712234,14.24 12.712234,17 L12.712234,49 C12.712234,51.76 14.952234,54 17.712234,54 L49.712234,54 C52.472234,54 54.712234,51.76 54.712234,49 L54.712234,17 C54.712234,14.24 52.472234,12 49.712234,12 Z M44.712234,47 L22.712234,47 L22.712234,45 L44.712234,45 L44.712234,47 Z M24.182234,40.88 L23.242234,39.12 L40.562234,30 L23.242234,20.88 L24.182234,19.12 L44.862234,30 L24.182234,40.88 Z" id="greater_than_equal" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div>
  <code style="font-size:11px;">&nbsp;col_vals_gte()</code>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="count" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>count</code>
  </p>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="0" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>0</code></p></div>
</div></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td class="gt_row gt_right" style="font-size: 11px; height:  40px"><code>100</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>99</code><br><code>0.99</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>1</code><br><code>0.01</code></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="color: #E5AB00;">●</span></p>
</div></td>
<td class="gt_row gt_center" style="background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="height:  40px"><div class='gt_from_md'><a href="data:text/csv;base64,Imxlbmd0aCIsIndlaWdodCIsImNvdW50IiwicHJvcCIsImdyb3VwIgoiNC44OTIwNzA3MjgyNzg0OCIsOS40ODMzMzQzNjY1NjcwMSwtMSwiMC40NTUiLCJXIgo=" download="extract_0006.csv">
  <button aria-label="There are 1 &#39;fail&#39; rows available as a CSV file." data-balloon-pos="left" style="background-color:#67C2DC;color:#FFFFFF;border:none;padding:5px;font-weight:bold;cursor:pointer;border-radius:4px;">CSV</button>
</a>
</div></td></tr>
    <tr><td class="gt_row gt_left" style="background-color: #CF142B; height:  40px"></td>
<td class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height:  40px">7</td>
<td class="gt_row gt_left" style="height:  40px"><div class='gt_from_md'><div aria-label="Expect that values in `prop` should be between `0` and `1`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <defs>        <path d="M10.712234,0 L56.712234,0 C62.2350815,-1.01453063e-15 66.712234,4.4771525 66.712234,10 L66.712234,66 L10.712234,66 C5.18938647,66 0.712233968,61.5228475 0.712233968,56 L0.712233968,10 C0.712233968,4.4771525 5.18938647,1.01453063e-15 10.712234,0 Z" id="path-1"></path>    </defs>    <g id="pointblank" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_between" transform="translate(-0.487938, 0.651308)">            <g id="rectangle">                <use fill="#FFFFFF" fill-rule="evenodd" xlink:href="#path-1"></use>                <path stroke="#000000" stroke-width="2" d="M65.712234,65 L65.712234,10 C65.712234,5.02943725 61.6827967,1 56.712234,1 L10.712234,1 C5.74167122,1 1.71223397,5.02943725 1.71223397,10 L1.71223397,56 C1.71223397,60.9705627 5.74167122,65 10.712234,65 L65.712234,65 Z"></path>            </g>            <path d="M11.993484,21.96875 C10.962234,22.082031 10.188797,22.964844 10.212234,24 L10.212234,42 C10.200515,42.722656 10.579422,43.390625 11.204422,43.753906 C11.825515,44.121094 12.598953,44.121094 13.220047,43.753906 C13.845047,43.390625 14.223953,42.722656 14.212234,42 L14.212234,24 C14.220047,23.457031 14.009109,22.9375 13.626297,22.554688 C13.243484,22.171875 12.723953,21.960938 12.180984,21.96875 C12.118484,21.964844 12.055984,21.964844 11.993484,21.96875 Z M55.993484,21.96875 C54.962234,22.082031 54.188797,22.964844 54.212234,24 L54.212234,42 C54.200515,42.722656 54.579422,43.390625 55.204422,43.753906 C55.825515,44.121094 56.598953,44.121094 57.220047,43.753906 C57.845047,43.390625 58.223953,42.722656 58.212234,42 L58.212234,24 C58.220047,23.457031 58.009109,22.9375 57.626297,22.554688 C57.243484,22.171875 56.723953,21.960938 56.180984,21.96875 C56.118484,21.964844 56.055984,21.964844 55.993484,21.96875 Z M16.212234,22 C15.661453,22 15.212234,22.449219 15.212234,23 C15.212234,23.550781 15.661453,24 16.212234,24 C16.763015,24 17.212234,23.550781 17.212234,23 C17.212234,22.449219 16.763015,22 16.212234,22 Z M20.212234,22 C19.661453,22 19.212234,22.449219 19.212234,23 C19.212234,23.550781 19.661453,24 20.212234,24 C20.763015,24 21.212234,23.550781 21.212234,23 C21.212234,22.449219 20.763015,22 20.212234,22 Z M24.212234,22 C23.661453,22 23.212234,22.449219 23.212234,23 C23.212234,23.550781 23.661453,24 24.212234,24 C24.763015,24 25.212234,23.550781 25.212234,23 C25.212234,22.449219 24.763015,22 24.212234,22 Z M28.212234,22 C27.661453,22 27.212234,22.449219 27.212234,23 C27.212234,23.550781 27.661453,24 28.212234,24 C28.763015,24 29.212234,23.550781 29.212234,23 C29.212234,22.449219 28.763015,22 28.212234,22 Z M32.212234,22 C31.661453,22 31.212234,22.449219 31.212234,23 C31.212234,23.550781 31.661453,24 32.212234,24 C32.763015,24 33.212234,23.550781 33.212234,23 C33.212234,22.449219 32.763015,22 32.212234,22 Z M36.212234,22 C35.661453,22 35.212234,22.449219 35.212234,23 C35.212234,23.550781 35.661453,24 36.212234,24 C36.763015,24 37.212234,23.550781 37.212234,23 C37.212234,22.449219 36.763015,22 36.212234,22 Z M40.212234,22 C39.661453,22 39.212234,22.449219 39.212234,23 C39.212234,23.550781 39.661453,24 40.212234,24 C40.763015,24 41.212234,23.550781 41.212234,23 C41.212234,22.449219 40.763015,22 40.212234,22 Z M44.212234,22 C43.661453,22 43.212234,22.449219 43.212234,23 C43.212234,23.550781 43.661453,24 44.212234,24 C44.763015,24 45.212234,23.550781 45.212234,23 C45.212234,22.449219 44.763015,22 44.212234,22 Z M48.212234,22 C47.661453,22 47.212234,22.449219 47.212234,23 C47.212234,23.550781 47.661453,24 48.212234,24 C48.763015,24 49.212234,23.550781 49.212234,23 C49.212234,22.449219 48.763015,22 48.212234,22 Z M52.212234,22 C51.661453,22 51.212234,22.449219 51.212234,23 C51.212234,23.550781 51.661453,24 52.212234,24 C52.763015,24 53.212234,23.550781 53.212234,23 C53.212234,22.449219 52.763015,22 52.212234,22 Z M21.462234,27.96875 C21.419265,27.976563 21.376297,27.988281 21.337234,28 C21.177078,28.027344 21.02864,28.089844 20.899734,28.1875 L15.618484,32.1875 C15.356765,32.375 15.200515,32.679688 15.200515,33 C15.200515,33.320313 15.356765,33.625 15.618484,33.8125 L20.899734,37.8125 C21.348953,38.148438 21.985672,38.058594 22.321609,37.609375 C22.657547,37.160156 22.567703,36.523438 22.118484,36.1875 L19.212234,34 L49.212234,34 L46.305984,36.1875 C45.856765,36.523438 45.766922,37.160156 46.102859,37.609375 C46.438797,38.058594 47.075515,38.148438 47.524734,37.8125 L52.805984,33.8125 C53.067703,33.625 53.223953,33.320313 53.223953,33 C53.223953,32.679688 53.067703,32.375 52.805984,32.1875 L47.524734,28.1875 C47.30989,28.027344 47.040359,27.960938 46.774734,28 C46.743484,28 46.712234,28 46.680984,28 C46.282547,28.074219 45.96614,28.382813 45.884109,28.78125 C45.802078,29.179688 45.970047,29.585938 46.305984,29.8125 L49.212234,32 L19.212234,32 L22.118484,29.8125 C22.520828,29.566406 22.696609,29.070313 22.536453,28.625 C22.380203,28.179688 21.930984,27.90625 21.462234,27.96875 Z M16.212234,42 C15.661453,42 15.212234,42.449219 15.212234,43 C15.212234,43.550781 15.661453,44 16.212234,44 C16.763015,44 17.212234,43.550781 17.212234,43 C17.212234,42.449219 16.763015,42 16.212234,42 Z M20.212234,42 C19.661453,42 19.212234,42.449219 19.212234,43 C19.212234,43.550781 19.661453,44 20.212234,44 C20.763015,44 21.212234,43.550781 21.212234,43 C21.212234,42.449219 20.763015,42 20.212234,42 Z M24.212234,42 C23.661453,42 23.212234,42.449219 23.212234,43 C23.212234,43.550781 23.661453,44 24.212234,44 C24.763015,44 25.212234,43.550781 25.212234,43 C25.212234,42.449219 24.763015,42 24.212234,42 Z M28.212234,42 C27.661453,42 27.212234,42.449219 27.212234,43 C27.212234,43.550781 27.661453,44 28.212234,44 C28.763015,44 29.212234,43.550781 29.212234,43 C29.212234,42.449219 28.763015,42 28.212234,42 Z M32.212234,42 C31.661453,42 31.212234,42.449219 31.212234,43 C31.212234,43.550781 31.661453,44 32.212234,44 C32.763015,44 33.212234,43.550781 33.212234,43 C33.212234,42.449219 32.763015,42 32.212234,42 Z M36.212234,42 C35.661453,42 35.212234,42.449219 35.212234,43 C35.212234,43.550781 35.661453,44 36.212234,44 C36.763015,44 37.212234,43.550781 37.212234,43 C37.212234,42.449219 36.763015,42 36.212234,42 Z M40.212234,42 C39.661453,42 39.212234,42.449219 39.212234,43 C39.212234,43.550781 39.661453,44 40.212234,44 C40.763015,44 41.212234,43.550781 41.212234,43 C41.212234,42.449219 40.763015,42 40.212234,42 Z M44.212234,42 C43.661453,42 43.212234,42.449219 43.212234,43 C43.212234,43.550781 43.661453,44 44.212234,44 C44.763015,44 45.212234,43.550781 45.212234,43 C45.212234,42.449219 44.763015,42 44.212234,42 Z M48.212234,42 C47.661453,42 47.212234,42.449219 47.212234,43 C47.212234,43.550781 47.661453,44 48.212234,44 C48.763015,44 49.212234,43.550781 49.212234,43 C49.212234,42.449219 48.763015,42 48.212234,42 Z M52.212234,42 C51.661453,42 51.212234,42.449219 51.212234,43 C51.212234,43.550781 51.661453,44 52.212234,44 C52.763015,44 53.212234,43.550781 53.212234,43 C53.212234,42.449219 52.763015,42 52.212234,42 Z" id="inside_range" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div>
  <code style="font-size:10px;">&nbsp;col_vals_between()</code>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="prop" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>prop</code>
  </p>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="[0, 1]" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>[0, 1]</code></p></div>
</div></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td class="gt_row gt_right" style="font-size: 11px; height:  40px"><code>100</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>98</code><br><code>0.98</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>2</code><br><code>0.02</code></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="color: #E5AB00;">●</span></p>
</div></td>
<td class="gt_row gt_center" style="background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="color: #CF142B;">●</span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="height:  40px"><div class='gt_from_md'><a href="data:text/csv;base64,Imxlbmd0aCIsIndlaWdodCIsImNvdW50IiwicHJvcCIsImdyb3VwIgoiOC43NTg3NjQzMjcwNDU1Iiw1Ljc1MjU0MTIxMTAzOTcxLDMsIjUuMyUiLCJLIgoiNC41NzE4MDU4MTc3NTA4MyIsMTEuNzI1ODAyNTcwNzY0MiwyLCIxLjEiLCJIIgo=" download="extract_0007.csv">
  <button aria-label="There are 2 &#39;fail&#39; rows available as a CSV file." data-balloon-pos="left" style="background-color:#67C2DC;color:#FFFFFF;border:none;padding:5px;font-weight:bold;cursor:pointer;border-radius:4px;">CSV</button>
</a>
</div></td></tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="14"><span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin-left:10px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;padding:2px 10px 2px 10px;">2021-11-01 17:04:30 UTC</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;margin:5px 1px 5px 0;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">&lt; 1 s</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 1px 5px -1px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">2021-11-01 17:04:31 UTC</span></td>
    </tr>
  </tfoot>
  
</table>
</div>

    eval_d %>% 
      get_agent_report(display_table = F)

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
