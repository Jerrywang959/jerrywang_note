# DataFrame

创建一个DataFrame


```R
Country = c("Brazil", "China", "India", "Switzerland", "USA")
LifeExpectancy = c(74, 76, 65, 83, 79)
Data = data.frame(Country, LifeExpectancy)
Data
```


<table>
<caption>A data.frame: 5 × 2</caption>
<thead>
	<tr><th scope=col>Country</th><th scope=col>LifeExpectancy</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Brazil     </td><td>74</td></tr>
	<tr><td>China      </td><td>76</td></tr>
	<tr><td>India      </td><td>65</td></tr>
	<tr><td>Switzerland</td><td>83</td></tr>
	<tr><td>USA        </td><td>79</td></tr>
</tbody>
</table>



给DataFrame增加列


```R
Population = c(199000, 1390000, 1240000, 7997, 318000)
Data2 = cbind(Data, Population)
Data2
```


<table>
<caption>A data.frame: 5 × 3</caption>
<thead>
	<tr><th scope=col>Country</th><th scope=col>LifeExpectancy</th><th scope=col>Population</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Brazil     </td><td>74</td><td> 199000</td></tr>
	<tr><td>China      </td><td>76</td><td>1390000</td></tr>
	<tr><td>India      </td><td>65</td><td>1240000</td></tr>
	<tr><td>Switzerland</td><td>83</td><td>   7997</td></tr>
	<tr><td>USA        </td><td>79</td><td> 318000</td></tr>
</tbody>
</table>



给DataFrame增加行


```R
Country = c("Australia", "Greece")
LifeExpectancy = c(82, 81)
Population = c(23050, 11125)
NewData = data.frame(Country, LifeExpectancy, Population)
NewData
```


<table>
<caption>A data.frame: 2 × 3</caption>
<thead>
	<tr><th scope=col>Country</th><th scope=col>LifeExpectancy</th><th scope=col>Population</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Australia</td><td>82</td><td>23050</td></tr>
	<tr><td>Greece   </td><td>81</td><td>11125</td></tr>
</tbody>
</table>




```R
Data3 = rbind(Data2, NewData)
Data3
```


<table>
<caption>A data.frame: 7 × 3</caption>
<thead>
	<tr><th scope=col>Country</th><th scope=col>LifeExpectancy</th><th scope=col>Population</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Brazil     </td><td>74</td><td> 199000</td></tr>
	<tr><td>China      </td><td>76</td><td>1390000</td></tr>
	<tr><td>India      </td><td>65</td><td>1240000</td></tr>
	<tr><td>Switzerland</td><td>83</td><td>   7997</td></tr>
	<tr><td>USA        </td><td>79</td><td> 318000</td></tr>
	<tr><td>Australia  </td><td>82</td><td>  23050</td></tr>
	<tr><td>Greece     </td><td>81</td><td>  11125</td></tr>
</tbody>
</table>



# DataFrame获得数据概要

获取当前路径


```R
getwd()
```


'/home/jerrywang/GitHub/jerrywang_note/docs/Course_study/DM-ML'


读取数据文件，这包含了世界卫生组织（WHO）在所有国家/地区的最新统计数据


```R
WHO = read.csv("WHO.csv")
WHO
```


<table>
<caption>A data.frame: 194 × 13</caption>
<thead>
	<tr><th scope=col>Country</th><th scope=col>Region</th><th scope=col>Population</th><th scope=col>Under15</th><th scope=col>Over60</th><th scope=col>FertilityRate</th><th scope=col>LifeExpectancy</th><th scope=col>ChildMortality</th><th scope=col>CellularSubscribers</th><th scope=col>LiteracyRate</th><th scope=col>GNI</th><th scope=col>PrimarySchoolEnrollmentMale</th><th scope=col>PrimarySchoolEnrollmentFemale</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Afghanistan                     </td><td>Eastern Mediterranean</td><td> 29825</td><td>47.42</td><td> 3.82</td><td>5.40</td><td>60</td><td> 98.5</td><td> 54.26</td><td>  NA</td><td> 1140</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Albania                         </td><td>Europe               </td><td>  3162</td><td>21.33</td><td>14.93</td><td>1.75</td><td>74</td><td> 16.7</td><td> 96.39</td><td>  NA</td><td> 8820</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Algeria                         </td><td>Africa               </td><td> 38482</td><td>27.42</td><td> 7.17</td><td>2.83</td><td>73</td><td> 20.0</td><td> 98.99</td><td>  NA</td><td> 8310</td><td>98.2</td><td>96.4</td></tr>
	<tr><td>Andorra                         </td><td>Europe               </td><td>    78</td><td>15.20</td><td>22.86</td><td>  NA</td><td>82</td><td>  3.2</td><td> 75.49</td><td>  NA</td><td>   NA</td><td>78.4</td><td>79.4</td></tr>
	<tr><td>Angola                          </td><td>Africa               </td><td> 20821</td><td>47.58</td><td> 3.84</td><td>6.10</td><td>51</td><td>163.5</td><td> 48.38</td><td>70.1</td><td> 5230</td><td>93.1</td><td>78.2</td></tr>
	<tr><td>Antigua and Barbuda             </td><td>Americas             </td><td>    89</td><td>25.96</td><td>12.35</td><td>2.12</td><td>75</td><td>  9.9</td><td>196.41</td><td>99.0</td><td>17900</td><td>91.1</td><td>84.5</td></tr>
	<tr><td>Argentina                       </td><td>Americas             </td><td> 41087</td><td>24.42</td><td>14.97</td><td>2.20</td><td>76</td><td> 14.2</td><td>134.92</td><td>97.8</td><td>17130</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Armenia                         </td><td>Europe               </td><td>  2969</td><td>20.34</td><td>14.06</td><td>1.74</td><td>71</td><td> 16.4</td><td>103.57</td><td>99.6</td><td> 6100</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Australia                       </td><td>Western Pacific      </td><td> 23050</td><td>18.95</td><td>19.46</td><td>1.89</td><td>82</td><td>  4.9</td><td>108.34</td><td>  NA</td><td>38110</td><td>96.9</td><td>97.5</td></tr>
	<tr><td>Austria                         </td><td>Europe               </td><td>  8464</td><td>14.51</td><td>23.52</td><td>1.44</td><td>81</td><td>  4.0</td><td>154.78</td><td>  NA</td><td>42050</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Azerbaijan                      </td><td>Europe               </td><td>  9309</td><td>22.25</td><td> 8.24</td><td>1.96</td><td>71</td><td> 35.2</td><td>108.75</td><td>  NA</td><td> 8960</td><td>85.3</td><td>84.1</td></tr>
	<tr><td>Bahamas                         </td><td>Americas             </td><td>   372</td><td>21.62</td><td>11.24</td><td>1.90</td><td>75</td><td> 16.9</td><td> 86.06</td><td>  NA</td><td>   NA</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Bahrain                         </td><td>Eastern Mediterranean</td><td>  1318</td><td>20.16</td><td> 3.38</td><td>2.12</td><td>79</td><td>  9.6</td><td>127.96</td><td>91.9</td><td>   NA</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Bangladesh                      </td><td>South-East Asia      </td><td>155000</td><td>30.57</td><td> 6.89</td><td>2.24</td><td>70</td><td> 40.9</td><td> 56.06</td><td>56.8</td><td> 1940</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Barbados                        </td><td>Americas             </td><td>   283</td><td>18.99</td><td>15.78</td><td>1.84</td><td>78</td><td> 18.4</td><td>127.01</td><td>  NA</td><td>   NA</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Belarus                         </td><td>Europe               </td><td>  9405</td><td>15.10</td><td>19.31</td><td>1.47</td><td>71</td><td>  5.2</td><td>111.88</td><td>  NA</td><td>14460</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Belgium                         </td><td>Europe               </td><td> 11060</td><td>16.88</td><td>23.81</td><td>1.85</td><td>80</td><td>  4.2</td><td>116.61</td><td>  NA</td><td>39190</td><td>98.9</td><td>99.2</td></tr>
	<tr><td>Belize                          </td><td>Americas             </td><td>   324</td><td>34.40</td><td> 5.74</td><td>2.76</td><td>74</td><td> 18.3</td><td> 69.96</td><td>  NA</td><td> 6090</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Benin                           </td><td>Africa               </td><td> 10051</td><td>42.95</td><td> 4.54</td><td>5.01</td><td>57</td><td> 89.5</td><td> 85.33</td><td>42.4</td><td> 1620</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Bhutan                          </td><td>South-East Asia      </td><td>   742</td><td>28.53</td><td> 6.90</td><td>2.32</td><td>67</td><td> 44.6</td><td> 65.58</td><td>  NA</td><td> 5570</td><td>88.3</td><td>91.5</td></tr>
	<tr><td>Bolivia (Plurinational State of)</td><td>Americas             </td><td> 10496</td><td>35.23</td><td> 7.28</td><td>3.31</td><td>67</td><td> 41.4</td><td> 82.82</td><td>  NA</td><td> 4890</td><td>91.2</td><td>91.5</td></tr>
	<tr><td>Bosnia and Herzegovina          </td><td>Europe               </td><td>  3834</td><td>16.35</td><td>20.52</td><td>1.26</td><td>76</td><td>  6.7</td><td> 84.52</td><td>97.9</td><td> 9190</td><td>86.5</td><td>88.4</td></tr>
	<tr><td>Botswana                        </td><td>Africa               </td><td>  2004</td><td>33.75</td><td> 5.63</td><td>2.71</td><td>66</td><td> 53.3</td><td>142.82</td><td>84.5</td><td>14550</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Brazil                          </td><td>Americas             </td><td>199000</td><td>24.56</td><td>10.81</td><td>1.82</td><td>74</td><td> 14.4</td><td>124.26</td><td>  NA</td><td>11420</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Brunei Darussalam               </td><td>Western Pacific      </td><td>   412</td><td>25.75</td><td> 7.03</td><td>2.03</td><td>77</td><td>  8.0</td><td>109.17</td><td>95.2</td><td>   NA</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Bulgaria                        </td><td>Europe               </td><td>  7278</td><td>13.53</td><td>26.11</td><td>1.51</td><td>74</td><td> 12.1</td><td>140.68</td><td>  NA</td><td>14160</td><td>99.3</td><td>99.7</td></tr>
	<tr><td>Burkina Faso                    </td><td>Africa               </td><td> 16460</td><td>45.66</td><td> 3.88</td><td>5.78</td><td>56</td><td>102.4</td><td> 45.27</td><td>  NA</td><td> 1300</td><td>60.7</td><td>55.9</td></tr>
	<tr><td>Burundi                         </td><td>Africa               </td><td>  9850</td><td>44.20</td><td> 3.87</td><td>6.21</td><td>53</td><td>104.3</td><td> 22.33</td><td>67.2</td><td>  610</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Cambodia                        </td><td>Western Pacific      </td><td> 14865</td><td>31.23</td><td> 7.67</td><td>2.93</td><td>65</td><td> 39.7</td><td> 96.17</td><td>  NA</td><td> 2230</td><td>96.4</td><td>95.4</td></tr>
	<tr><td>Cameroon                        </td><td>Africa               </td><td> 21700</td><td>43.08</td><td> 4.89</td><td>4.94</td><td>53</td><td> 94.9</td><td> 52.35</td><td>  NA</td><td> 2330</td><td>99.6</td><td>87.4</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>Suriname                                 </td><td>Americas             </td><td>   535</td><td>27.83</td><td> 9.55</td><td>2.32</td><td>72</td><td>20.8</td><td>178.88</td><td>94.7</td><td>   NA</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Swaziland                                </td><td>Africa               </td><td>  1231</td><td>38.05</td><td> 5.34</td><td>3.48</td><td>50</td><td>79.7</td><td> 63.70</td><td>87.4</td><td> 5930</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Sweden                                   </td><td>Europe               </td><td>  9511</td><td>16.71</td><td>25.32</td><td>1.93</td><td>82</td><td> 2.9</td><td>118.57</td><td>  NA</td><td>42200</td><td>99.7</td><td>99.0</td></tr>
	<tr><td>Switzerland                              </td><td>Europe               </td><td>  7997</td><td>14.79</td><td>23.25</td><td>1.51</td><td>83</td><td> 4.3</td><td>131.43</td><td>  NA</td><td>52570</td><td>98.9</td><td>99.5</td></tr>
	<tr><td>Syrian Arab Republic                     </td><td>Eastern Mediterranean</td><td> 21890</td><td>35.35</td><td> 6.09</td><td>3.04</td><td>75</td><td>15.1</td><td> 63.17</td><td>83.4</td><td>   NA</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Tajikistan                               </td><td>Europe               </td><td>  8009</td><td>35.75</td><td> 4.80</td><td>3.81</td><td>68</td><td>58.3</td><td> 90.64</td><td>99.7</td><td> 2300</td><td>99.5</td><td>96.0</td></tr>
	<tr><td>Thailand                                 </td><td>South-East Asia      </td><td> 66785</td><td>18.47</td><td>13.96</td><td>1.43</td><td>74</td><td>13.2</td><td>111.63</td><td>  NA</td><td> 8360</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>The former Yugoslav Republic of Macedonia</td><td>Europe               </td><td>  2106</td><td>16.89</td><td>17.56</td><td>1.44</td><td>75</td><td> 7.4</td><td>107.24</td><td>97.3</td><td>11090</td><td>97.3</td><td>99.2</td></tr>
	<tr><td>Timor-Leste                              </td><td>South-East Asia      </td><td>  1114</td><td>46.33</td><td> 5.16</td><td>6.11</td><td>64</td><td>56.7</td><td> 53.23</td><td>58.3</td><td>   NA</td><td>86.2</td><td>85.6</td></tr>
	<tr><td>Togo                                     </td><td>Africa               </td><td>  6643</td><td>41.89</td><td> 4.44</td><td>4.75</td><td>56</td><td>95.5</td><td> 50.45</td><td>  NA</td><td> 1040</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Tonga                                    </td><td>Western Pacific      </td><td>   105</td><td>37.33</td><td> 7.96</td><td>3.86</td><td>72</td><td>12.8</td><td> 52.63</td><td>  NA</td><td> 5000</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Trinidad and Tobago                      </td><td>Americas             </td><td>  1337</td><td>20.73</td><td>13.18</td><td>1.80</td><td>71</td><td>20.7</td><td>135.64</td><td>98.8</td><td>   NA</td><td>97.7</td><td>97.0</td></tr>
	<tr><td>Tunisia                                  </td><td>Eastern Mediterranean</td><td> 10875</td><td>23.22</td><td>10.49</td><td>2.04</td><td>76</td><td>16.1</td><td>116.93</td><td>  NA</td><td> 9030</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Turkey                                   </td><td>Europe               </td><td> 73997</td><td>26.00</td><td>10.56</td><td>2.08</td><td>76</td><td>14.2</td><td> 88.70</td><td>  NA</td><td>16940</td><td>99.5</td><td>98.3</td></tr>
	<tr><td>Turkmenistan                             </td><td>Europe               </td><td>  5173</td><td>28.65</td><td> 6.30</td><td>2.38</td><td>63</td><td>52.8</td><td> 68.77</td><td>99.6</td><td> 8690</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Tuvalu                                   </td><td>Western Pacific      </td><td>    10</td><td>30.61</td><td> 9.07</td><td>  NA</td><td>64</td><td>29.7</td><td> 21.63</td><td>  NA</td><td>   NA</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Uganda                                   </td><td>Africa               </td><td> 36346</td><td>48.54</td><td> 3.72</td><td>6.06</td><td>56</td><td>68.9</td><td> 48.38</td><td>73.2</td><td> 1310</td><td>89.7</td><td>92.3</td></tr>
	<tr><td>Ukraine                                  </td><td>Europe               </td><td> 45530</td><td>14.18</td><td>20.76</td><td>1.45</td><td>71</td><td>10.7</td><td>122.98</td><td>99.7</td><td> 7040</td><td>90.8</td><td>91.5</td></tr>
	<tr><td>United Arab Emirates                     </td><td>Eastern Mediterranean</td><td>  9206</td><td>14.41</td><td> 0.81</td><td>1.84</td><td>76</td><td> 8.4</td><td>148.62</td><td>  NA</td><td>47890</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>United Kingdom                           </td><td>Europe               </td><td> 62783</td><td>17.54</td><td>23.06</td><td>1.90</td><td>80</td><td> 4.8</td><td>130.75</td><td>  NA</td><td>36010</td><td>99.8</td><td>99.6</td></tr>
	<tr><td>United Republic of Tanzania              </td><td>Africa               </td><td> 47783</td><td>44.85</td><td> 4.89</td><td>5.36</td><td>59</td><td>54.0</td><td> 55.53</td><td>73.2</td><td> 1500</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>United States of America                 </td><td>Americas             </td><td>318000</td><td>19.63</td><td>19.31</td><td>2.00</td><td>79</td><td> 7.1</td><td> 92.72</td><td>  NA</td><td>48820</td><td>95.4</td><td>96.1</td></tr>
	<tr><td>Uruguay                                  </td><td>Americas             </td><td>  3395</td><td>22.05</td><td>18.59</td><td>2.07</td><td>77</td><td> 7.2</td><td>140.75</td><td>98.1</td><td>14640</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Uzbekistan                               </td><td>Europe               </td><td> 28541</td><td>28.90</td><td> 6.38</td><td>2.38</td><td>68</td><td>39.6</td><td> 91.65</td><td>99.4</td><td> 3420</td><td>93.3</td><td>91.0</td></tr>
	<tr><td>Vanuatu                                  </td><td>Western Pacific      </td><td>   247</td><td>37.37</td><td> 6.02</td><td>3.46</td><td>72</td><td>17.9</td><td> 55.76</td><td>82.6</td><td> 4330</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Venezuela (Bolivarian Republic of)       </td><td>Americas             </td><td> 29955</td><td>28.84</td><td> 9.17</td><td>2.44</td><td>75</td><td>15.3</td><td> 97.78</td><td>  NA</td><td>12430</td><td>94.7</td><td>95.1</td></tr>
	<tr><td>Viet Nam                                 </td><td>Western Pacific      </td><td> 90796</td><td>22.87</td><td> 9.32</td><td>1.79</td><td>75</td><td>23.0</td><td>143.39</td><td>93.2</td><td> 3250</td><td>  NA</td><td>  NA</td></tr>
	<tr><td>Yemen                                    </td><td>Eastern Mediterranean</td><td> 23852</td><td>40.72</td><td> 4.54</td><td>4.35</td><td>64</td><td>60.0</td><td> 47.05</td><td>63.9</td><td> 2170</td><td>85.5</td><td>70.5</td></tr>
	<tr><td>Zambia                                   </td><td>Africa               </td><td> 14075</td><td>46.73</td><td> 3.95</td><td>5.77</td><td>55</td><td>88.5</td><td> 60.59</td><td>71.2</td><td> 1490</td><td>91.4</td><td>93.9</td></tr>
	<tr><td>Zimbabwe                                 </td><td>Africa               </td><td> 13724</td><td>40.24</td><td> 5.68</td><td>3.64</td><td>54</td><td>89.8</td><td> 72.13</td><td>92.2</td><td>   NA</td><td>  NA</td><td>  NA</td></tr>
</tbody>
</table>



## 数据结构
`str()`函数向我们展示了数据的结构


```R
str(WHO)
```

```output
    'data.frame':	194 obs. of  13 variables:
     $ Country                      : Factor w/ 194 levels "Afghanistan",..: 1 2 3 4 5 6 7 8 9 10 ...
     $ Region                       : Factor w/ 6 levels "Africa","Americas",..: 3 4 1 4 1 2 2 4 6 4 ...
     $ Population                   : int  29825 3162 38482 78 20821 89 41087 2969 23050 8464 ...
     $ Under15                      : num  47.4 21.3 27.4 15.2 47.6 ...
     $ Over60                       : num  3.82 14.93 7.17 22.86 3.84 ...
     $ FertilityRate                : num  5.4 1.75 2.83 NA 6.1 2.12 2.2 1.74 1.89 1.44 ...
     $ LifeExpectancy               : int  60 74 73 82 51 75 76 71 82 81 ...
     $ ChildMortality               : num  98.5 16.7 20 3.2 163.5 ...
     $ CellularSubscribers          : num  54.3 96.4 99 75.5 48.4 ...
     $ LiteracyRate                 : num  NA NA NA NA 70.1 99 97.8 99.6 NA NA ...
     $ GNI                          : num  1140 8820 8310 NA 5230 ...
     $ PrimarySchoolEnrollmentMale  : num  NA NA 98.2 78.4 93.1 91.1 NA NA 96.9 NA ...
     $ PrimarySchoolEnrollmentFemale: num  NA NA 96.4 79.4 78.2 84.5 NA NA 97.5 NA ...

```

可以看出，这是一个包含194个观测值和13个变量的DataFrame，变量名显示在左列，右边显示的是相应变量的类型，包括Factor、num、int。Factor应该是类型变量，显示了包含的类型的个数。num应该为一般的数字，int为整数

`summary()`函数显示DataFrame的摘要。包括最小最大值，均值，第一、第二、第三个四分位数。


```R
summary(WHO)
```


```output
                    Country                      Region     Population     
     Afghanistan        :  1   Africa               :46   Min.   :      1  
     Albania            :  1   Americas             :35   1st Qu.:   1696  
     Algeria            :  1   Eastern Mediterranean:22   Median :   7790  
     Andorra            :  1   Europe               :53   Mean   :  36360  
     Angola             :  1   South-East Asia      :11   3rd Qu.:  24535  
     Antigua and Barbuda:  1   Western Pacific      :27   Max.   :1390000  
     (Other)            :188                                               
        Under15          Over60      FertilityRate   LifeExpectancy 
     Min.   :13.12   Min.   : 0.81   Min.   :1.260   Min.   :47.00  
     1st Qu.:18.72   1st Qu.: 5.20   1st Qu.:1.835   1st Qu.:64.00  
     Median :28.65   Median : 8.53   Median :2.400   Median :72.50  
     Mean   :28.73   Mean   :11.16   Mean   :2.941   Mean   :70.01  
     3rd Qu.:37.75   3rd Qu.:16.69   3rd Qu.:3.905   3rd Qu.:76.00  
     Max.   :49.99   Max.   :31.92   Max.   :7.580   Max.   :83.00  
                                     NA's   :11                     
     ChildMortality    CellularSubscribers  LiteracyRate        GNI       
     Min.   :  2.200   Min.   :  2.57      Min.   :31.10   Min.   :  340  
     1st Qu.:  8.425   1st Qu.: 63.57      1st Qu.:71.60   1st Qu.: 2335  
     Median : 18.600   Median : 97.75      Median :91.80   Median : 7870  
     Mean   : 36.149   Mean   : 93.64      Mean   :83.71   Mean   :13321  
     3rd Qu.: 55.975   3rd Qu.:120.81      3rd Qu.:97.85   3rd Qu.:17558  
     Max.   :181.600   Max.   :196.41      Max.   :99.80   Max.   :86440  
                       NA's   :10          NA's   :91      NA's   :32     
     PrimarySchoolEnrollmentMale PrimarySchoolEnrollmentFemale
     Min.   : 37.20              Min.   : 32.50               
     1st Qu.: 87.70              1st Qu.: 87.30               
     Median : 94.70              Median : 95.10               
     Mean   : 90.85              Mean   : 89.63               
     3rd Qu.: 98.10              3rd Qu.: 97.90               
     Max.   :100.00              Max.   :100.00               
     NA's   :93                  NA's   :93                   
```


选择DataFrame的子数据生成新的DataFrame


```R
SEA = subset(WHO, Region == "South-East Asia")
str(SEA)
```

```output
    'data.frame':	11 obs. of  13 variables:
     $ Country                      : Factor w/ 194 levels "Afghanistan",..: 14 20 47 78 79 104 117 120 163 171 ...
     $ Region                       : Factor w/ 6 levels "Africa","Americas",..: 5 5 5 5 5 5 5 5 5 5 ...
     $ Population                   : int  155000 742 24763 1240000 247000 338 52797 27474 21098 66785 ...
     $ Under15                      : num  30.6 28.5 22 29.4 29.3 ...
     $ Over60                       : num  6.89 6.9 12.74 8.1 7.86 ...
     $ FertilityRate                : num  2.24 2.32 2 2.53 2.4 2.31 1.98 2.5 2.35 1.43 ...
     $ LifeExpectancy               : int  70 67 69 65 69 77 65 68 75 74 ...
     $ ChildMortality               : num  40.9 44.6 28.8 56.3 31 10.5 52.3 41.6 9.6 13.2 ...
     $ CellularSubscribers          : num  56.06 65.58 4.09 72 103.09 ...
     $ LiteracyRate                 : num  56.8 NA NA NA NA NA 92.3 60.3 91.2 NA ...
     $ GNI                          : num  1940 5570 NA 3590 4500 7430 NA 1260 5520 8360 ...
     $ PrimarySchoolEnrollmentMale  : num  NA 88.3 NA NA NA 96.5 NA NA 93.9 NA ...
     $ PrimarySchoolEnrollmentFemale: num  NA 91.5 NA NA NA 96.5 NA NA 94.4 NA ...

```

## 保存csv文件


```R
write.csv(SEA, "WHO_SEA.csv")
```


```R
ls()
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'Country'</li><li>'Data'</li><li>'Data2'</li><li>'Data3'</li><li>'LifeExpectancy'</li><li>'NewData'</li><li>'Population'</li><li>'SEA'</li><li>'WHO'</li></ol>



删除部分变量以释放内存


```R
rm(SEA)
ls()
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'Country'</li><li>'Data'</li><li>'Data2'</li><li>'Data3'</li><li>'LifeExpectancy'</li><li>'NewData'</li><li>'Population'</li><li>'WHO'</li></ol>



# 数据分析
访问DataFrame中的变量


```R
WHO$Under15
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>47.42</li><li>21.33</li><li>27.42</li><li>15.2</li><li>47.58</li><li>25.96</li><li>24.42</li><li>20.34</li><li>18.95</li><li>14.51</li><li>22.25</li><li>21.62</li><li>20.16</li><li>30.57</li><li>18.99</li><li>15.1</li><li>16.88</li><li>34.4</li><li>42.95</li><li>28.53</li><li>35.23</li><li>16.35</li><li>33.75</li><li>24.56</li><li>25.75</li><li>13.53</li><li>45.66</li><li>44.2</li><li>31.23</li><li>43.08</li><li>16.37</li><li>30.17</li><li>40.07</li><li>48.52</li><li>21.38</li><li>17.95</li><li>28.03</li><li>42.17</li><li>42.37</li><li>30.61</li><li>23.94</li><li>41.48</li><li>14.98</li><li>16.58</li><li>17.16</li><li>14.56</li><li>21.98</li><li>45.11</li><li>17.66</li><li>33.72</li><li>25.96</li><li>30.53</li><li>30.29</li><li>31.25</li><li>30.62</li><li>38.95</li><li>43.1</li><li>15.69</li><li>43.29</li><li>28.88</li><li>16.42</li><li>18.26</li><li>38.49</li><li>45.9</li><li>17.62</li><li>13.17</li><li>38.59</li><li>14.6</li><li>26.96</li><li>40.8</li><li>42.46</li><li>41.55</li><li>36.77</li><li>35.35</li><li>35.72</li><li>14.62</li><li>20.71</li><li>29.43</li><li>29.27</li><li>23.68</li><li>40.51</li><li>21.54</li><li>27.53</li><li>14.04</li><li>27.78</li><li>13.12</li><li>34.13</li><li>25.46</li><li>42.37</li><li>30.1</li><li>24.9</li><li>30.21</li><li>35.61</li><li>14.57</li><li>21.64</li><li>36.75</li><li>43.06</li><li>29.45</li><li>15.13</li><li>17.46</li><li>42.72</li><li>45.44</li><li>26.65</li><li>29.03</li><li>47.14</li><li>14.98</li><li>30.1</li><li>40.22</li><li>20.17</li><li>29.02</li><li>35.81</li><li>18.26</li><li>27.05</li><li>19.01</li><li>27.85</li><li>45.38</li><li>25.28</li><li>36.59</li><li>30.1</li><li>35.58</li><li>17.21</li><li>20.26</li><li>33.37</li><li>49.99</li><li>44.23</li><li>30.61</li><li>18.64</li><li>24.19</li><li>34.31</li><li>30.1</li><li>28.65</li><li>38.37</li><li>32.78</li><li>29.18</li><li>34.53</li><li>14.91</li><li>14.92</li><li>13.28</li><li>15.25</li><li>16.52</li><li>15.05</li><li>15.45</li><li>43.56</li><li>25.96</li><li>24.31</li><li>25.7</li><li>37.88</li><li>14.04</li><li>41.6</li><li>29.69</li><li>43.54</li><li>16.45</li><li>21.95</li><li>41.74</li><li>16.48</li><li>15</li><li>14.16</li><li>40.37</li><li>47.35</li><li>29.53</li><li>42.28</li><li>15.2</li><li>25.15</li><li>41.48</li><li>27.83</li><li>38.05</li><li>16.71</li><li>14.79</li><li>35.35</li><li>35.75</li><li>18.47</li><li>16.89</li><li>46.33</li><li>41.89</li><li>37.33</li><li>20.73</li><li>23.22</li><li>26</li><li>28.65</li><li>30.61</li><li>48.54</li><li>14.18</li><li>14.41</li><li>17.54</li><li>44.85</li><li>19.63</li><li>22.05</li><li>28.9</li><li>37.37</li><li>28.84</li><li>22.87</li><li>40.72</li><li>46.73</li><li>40.24</li></ol>



均值


```R
mean(WHO$Under15)
```


28.7324226804124


标准差


```R
sd(WHO$Under15)
```


10.5345733199238


摘要


```R
summary(WHO$Under15)
```


```output
       Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
      13.12   18.72   28.65   28.73   37.75   49.99 
```


## which.min
找出哪个国家在15岁以下的人口最少的


```R
which.min(WHO$Under15)
```


86



```R
WHO$Country[86]
```


Japan
<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<style>
	.list-inline {list-style: none; margin:0; padding: 0}
	.list-inline>li {display: inline-block}
	.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
	</style>
	<ol class=list-inline><li>'Afghanistan'</li><li>'Albania'</li><li>'Algeria'</li><li>'Andorra'</li><li>'Angola'</li><li>'Antigua and Barbuda'</li><li>'Argentina'</li><li>'Armenia'</li><li>'Australia'</li><li>'Austria'</li><li>'Azerbaijan'</li><li>'Bahamas'</li><li>'Bahrain'</li><li>'Bangladesh'</li><li>'Barbados'</li><li>'Belarus'</li><li>'Belgium'</li><li>'Belize'</li><li>'Benin'</li><li>'Bhutan'</li><li>'Bolivia (Plurinational State of)'</li><li>'Bosnia and Herzegovina'</li><li>'Botswana'</li><li>'Brazil'</li><li>'Brunei Darussalam'</li><li>'Bulgaria'</li><li>'Burkina Faso'</li><li>'Burundi'</li><li>'C\xaate d\'Ivoire'</li><li>'Cambodia'</li><li>'Cameroon'</li><li>'Canada'</li><li>'Cape Verde'</li><li>'Central African Republic'</li><li>'Chad'</li><li>'Chile'</li><li>'China'</li><li>'Colombia'</li><li>'Comoros'</li><li>'Congo'</li><li>'Cook Islands'</li><li>'Costa Rica'</li><li>'Croatia'</li><li>'Cuba'</li><li>'Cyprus'</li><li>'Czech Republic'</li><li>'Democratic People\'s Republic of Korea'</li><li>'Democratic Republic of the Congo'</li><li>'Denmark'</li><li>'Djibouti'</li><li>'Dominica'</li><li>'Dominican Republic'</li><li>'Ecuador'</li><li>'Egypt'</li><li>'El Salvador'</li><li>'Equatorial Guinea'</li><li>'Eritrea'</li><li>'Estonia'</li><li>'Ethiopia'</li><li>'Fiji'</li><li>'Finland'</li><li>'France'</li><li>'Gabon'</li><li>'Gambia'</li><li>'Georgia'</li><li>'Germany'</li><li>'Ghana'</li><li>'Greece'</li><li>'Grenada'</li><li>'Guatemala'</li><li>'Guinea'</li><li>'Guinea-Bissau'</li><li>'Guyana'</li><li>'Haiti'</li><li>'Honduras'</li><li>'Hungary'</li><li>'Iceland'</li><li>'India'</li><li>'Indonesia'</li><li>'Iran (Islamic Republic of)'</li><li>'Iraq'</li><li>'Ireland'</li><li>'Israel'</li><li>'Italy'</li><li>'Jamaica'</li><li>'Japan'</li><li>'Jordan'</li><li>'Kazakhstan'</li><li>'Kenya'</li><li>'Kiribati'</li><li>'Kuwait'</li><li>'Kyrgyzstan'</li><li>'Lao People\'s Democratic Republic'</li><li>'Latvia'</li><li>'Lebanon'</li><li>'Lesotho'</li><li>'Liberia'</li><li>'Libya'</li><li>'Lithuania'</li><li>'Luxembourg'</li><li>'Madagascar'</li><li>'Malawi'</li><li>'Malaysia'</li><li>'Maldives'</li><li>'Mali'</li><li>'Malta'</li><li>'Marshall Islands'</li><li>'Mauritania'</li><li>'Mauritius'</li><li>'Mexico'</li><li>'Micronesia (Federated States of)'</li><li>'Monaco'</li><li>'Mongolia'</li><li>'Montenegro'</li><li>'Morocco'</li><li>'Mozambique'</li><li>'Myanmar'</li><li>'Namibia'</li><li>'Nauru'</li><li>'Nepal'</li><li>'Netherlands'</li><li>'New Zealand'</li><li>'Nicaragua'</li><li>'Niger'</li><li>'Nigeria'</li><li>'Niue'</li><li>'Norway'</li><li>'Oman'</li><li>'Pakistan'</li><li>'Palau'</li><li>'Panama'</li><li>'Papua New Guinea'</li><li>'Paraguay'</li><li>'Peru'</li><li>'Philippines'</li><li>'Poland'</li><li>'Portugal'</li><li>'Qatar'</li><li>'Republic of Korea'</li><li>'Republic of Moldova'</li><li>'Romania'</li><li>'Russian Federation'</li><li>'Rwanda'</li><li>'Saint Kitts and Nevis'</li><li>'Saint Lucia'</li><li>'Saint Vincent and the Grenadines'</li><li>'Samoa'</li><li>'San Marino'</li><li>'Sao Tome and Principe'</li><li>'Saudi Arabia'</li><li>'Senegal'</li><li>'Serbia'</li><li>'Seychelles'</li><li>'Sierra Leone'</li><li>'Singapore'</li><li>'Slovakia'</li><li>'Slovenia'</li><li>'Solomon Islands'</li><li>'Somalia'</li><li>'South Africa'</li><li>'South Sudan'</li><li>'Spain'</li><li>'Sri Lanka'</li><li>'Sudan'</li><li>'Suriname'</li><li>'Swaziland'</li><li>'Sweden'</li><li>'Switzerland'</li><li>'Syrian Arab Republic'</li><li>'Tajikistan'</li><li>'Thailand'</li><li>'The former Yugoslav Republic of Macedonia'</li><li>'Timor-Leste'</li><li>'Togo'</li><li>'Tonga'</li><li>'Trinidad and Tobago'</li><li>'Tunisia'</li><li>'Turkey'</li><li>'Turkmenistan'</li><li>'Tuvalu'</li><li>'Uganda'</li><li>'Ukraine'</li><li>'United Arab Emirates'</li><li>'United Kingdom'</li><li>'United Republic of Tanzania'</li><li>'United States of America'</li><li>'Uruguay'</li><li>'Uzbekistan'</li><li>'Vanuatu'</li><li>'Venezuela (Bolivarian Republic of)'</li><li>'Viet Nam'</li><li>'Yemen'</li><li>'Zambia'</li><li>'Zimbabwe'</li></ol>
</details>


## 散点图
画GNI与FertilityRate的散点图


```R
plot(WHO$GNI, WHO$FertilityRate)
```


![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/R_usage_2_36_0.png ':size=500')


## subset
使用`subset()`找出收入高，生育率高的国家


```R
Outliers = subset(WHO,  GNI > 10000 & FertilityRate > 2.5)
nrow(Outliers)
```


7


`nrow`函数返回DataFrame中的行数或观察值，我们可以看到有七个这样的国家。让我们仅输出国名，国民总收入和这七个国家的生育率。


```R
Outliers[c("Country", "GNI", "FertilityRate")]
```


<table>
<caption>A data.frame: 7 × 3</caption>
<thead>
	<tr><th></th><th scope=col>Country</th><th scope=col>GNI</th><th scope=col>FertilityRate</th></tr>
	<tr><th></th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>23</th><td>Botswana         </td><td>14550</td><td>2.71</td></tr>
	<tr><th scope=row>56</th><td>Equatorial Guinea</td><td>25620</td><td>5.04</td></tr>
	<tr><th scope=row>63</th><td>Gabon            </td><td>13740</td><td>4.18</td></tr>
	<tr><th scope=row>83</th><td>Israel           </td><td>27110</td><td>2.92</td></tr>
	<tr><th scope=row>88</th><td>Kazakhstan       </td><td>11250</td><td>2.52</td></tr>
	<tr><th scope=row>131</th><td>Panama           </td><td>14510</td><td>2.52</td></tr>
	<tr><th scope=row>150</th><td>Saudi Arabia     </td><td>24700</td><td>2.76</td></tr>
</tbody>
</table>



## 直方图
创建预期寿命的直方图


```R
hist(WHO$LifeExpectancy)
```


![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/R_usage_2_42_0.png ':size=500')


## 箱形图
画一个按照区域排序的LifeExpectancy箱形图


```R
boxplot(WHO$LifeExpectancy ~ WHO$Region)
```


![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/R_usage_2_44_0.png ':size=500')


对图像做简单的注释


```R
boxplot(WHO$LifeExpectancy ~ WHO$Region, xlab = "Region", ylab = "Life Expectancy", main = "Life Expectancy of Countries by Region")
```


![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/R_usage_2_46_0.png ':size=500')


## 选择并生成表
生成类型变量的汇总表


```R
table(WHO$Region)
```


```output
    
                   Africa              Americas Eastern Mediterranean 
                       46                    35                    22 
                   Europe       South-East Asia       Western Pacific 
                       53                    11                    27 
```


生成数值变量某一特征的汇总表，按照`WHO$Region`排序


```R
tapply(WHO$Over60, WHO$Region, mean)
```


<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>Africa</dt><dd>5.22065217391304</dd><dt>Americas</dt><dd>10.9437142857143</dd><dt>Eastern Mediterranean</dt><dd>5.62</dd><dt>Europe</dt><dd>19.7749056603774</dd><dt>South-East Asia</dt><dd>8.76909090909091</dd><dt>Western Pacific</dt><dd>10.162962962963</dd></dl>



按照第二个变量分类和排序，生成第一个变量的最小值表


```R
tapply(WHO$LiteracyRate, WHO$Region, min)
```


<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>Africa</dt><dd>&lt;NA&gt;</dd><dt>Americas</dt><dd>&lt;NA&gt;</dd><dt>Eastern Mediterranean</dt><dd>&lt;NA&gt;</dd><dt>Europe</dt><dd>&lt;NA&gt;</dd><dt>South-East Asia</dt><dd>&lt;NA&gt;</dd><dt>Western Pacific</dt><dd>&lt;NA&gt;</dd></dl>



这是因为有缺失值的存在，删除缺失值后解决


```R
tapply(WHO$LiteracyRate, WHO$Region, min, na.rm = TRUE)
```


<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>Africa</dt><dd>31.1</dd><dt>Americas</dt><dd>75.2</dd><dt>Eastern Mediterranean</dt><dd>63.9</dd><dt>Europe</dt><dd>95.2</dd><dt>South-East Asia</dt><dd>56.8</dd><dt>Western Pacific</dt><dd>60.6</dd></dl>


