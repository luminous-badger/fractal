#!/usr/bin/perl
## $Author: johnm $
## $Date: 2012/02/27 11:12:58 $
## $Header: RCS/header.pl,v 1.1 2012/02/27 11:12:58 johnm Exp $
## $Id: header.pl,v 1.1 2012/02/27 11:12:58 johnm Exp $
## $RCSfile: header.pl,v $
## $Revision: 1.1 $

## Colour map for boat.
## JM Fri Aug 30 13:26:03 BST 2013

#   0 = aliceblue            | 
#   1 = antiquewhite         |   2 = aqua                 |   3 = aquamarine           |   4 = azure                |   5 = beige                |   6 = bisque               |   7 = black                | 
#   8 = blanchedalmond       |   9 = blue                 |  10 = blueviolet           |  11 = brown                |  12 = burlywood            |  13 = cadetblue            |  14 = chartreuse           | 
#  15 = chocolate            |  16 = coral                |  17 = cornflowerblue       |  18 = cornsilk             |  19 = crimson              |  20 = cyan                 |  21 = darkblue             | 
#  22 = darkcyan             |  23 = darkgoldenrod        |  24 = darkgray             |  25 = darkgreen            |  26 = darkkhaki            |  27 = darkmagenta          |  28 = darkolivegreen       | 
#  29 = darkorange           |  30 = darkorchid           |  31 = darkred              |  32 = darksalmon           |  33 = darkseagreen         |  34 = darkslateblue        |  35 = darkslategray        | 
#  36 = darkturquoise        |  37 = darkviolet           |  38 = deeppink             |  39 = deepskyblue          |  40 = dimgray              |  41 = dodgerblue           |  42 = firebrick            | 
#  43 = floralwhite          |  44 = forestgreen          |  45 = fuchsia              |  46 = gainsboro            |  47 = ghostwhite           |  48 = gold                 |  49 = goldenrod            | 
#  50 = gradient1            |  51 = gradient10           |  52 = gradient11           |  53 = gradient12           |  54 = gradient13           |  55 = gradient14           |  56 = gradient15           | 
#  57 = gradient16           |  58 = gradient17           |  59 = gradient18           |  60 = gradient19           |  61 = gradient2            |  62 = gradient20           |  63 = gradient21           | 
#  64 = gradient22           |  65 = gradient23           |  66 = gradient24           |  67 = gradient25           |  68 = gradient26           |  69 = gradient27           |  70 = gradient28           | 
#  71 = gradient29           |  72 = gradient3            |  73 = gradient30           |  74 = gradient31           |  75 = gradient32           |  76 = gradient33           |  77 = gradient34           | 
#  78 = gradient35           |  79 = gradient36           |  80 = gradient37           |  81 = gradient38           |  82 = gradient39           |  83 = gradient4            |  84 = gradient40           | 
#  85 = gradient41           |  86 = gradient42           |  87 = gradient43           |  88 = gradient44           |  89 = gradient45           |  90 = gradient46           |  91 = gradient47           | 
#  92 = gradient48           |  93 = gradient49           |  94 = gradient5            |  95 = gradient50           |  96 = gradient6            |  97 = gradient7            |  98 = gradient8            | 
#  99 = gradient9            | 100 = gray                 | 101 = green                | 102 = greenyellow          | 103 = honeydew             | 104 = hotpink              | 105 = indianred            | 
# 106 = indigo               | 107 = ivory                | 108 = khaki                | 109 = lavender             | 110 = lavenderblush        | 111 = lawngreen            | 112 = lemonchiffon         | 
# 113 = lightblue            | 114 = lightcoral           | 115 = lightcyan            | 116 = lightgoldenrodyellow | 117 = lightgreen           | 118 = lightgrey            | 119 = lightpink            | 
# 120 = lightsalmon          | 121 = lightseagreen        | 122 = lightskyblue         | 123 = lightslategray       | 124 = lightsteelblue       | 125 = lightyellow          | 126 = lime                 | 
# 127 = limegreen            | 128 = linen                | 129 = magenta              | 130 = maroon               | 131 = mediumaquamarine     | 132 = mediumblue           | 133 = mediumorchid         | 
# 134 = mediumpurple         | 135 = mediumseagreen       | 136 = mediumslateblue      | 137 = mediumspringgreen    | 138 = mediumturquoise      | 139 = mediumvioletred      | 140 = midnightblue         | 
# 141 = mintcream            | 142 = mistyrose            | 143 = moccasin             | 144 = navajowhite          | 145 = navy                 | 146 = oldlace              | 147 = olive                | 
# 148 = olivedrab            | 149 = orange               | 150 = orangered            | 151 = orchid               | 152 = palegoldenrod        | 153 = palegreen            | 154 = paleturquoise        | 
# 155 = palevioletred        | 156 = papayawhip           | 157 = peachpuff            | 158 = peru                 | 159 = pink                 | 160 = plum                 | 161 = powderblue           | 
# 162 = purple               | 163 = red                  | 164 = rosybrown            | 165 = royalblue            | 166 = saddlebrown          | 167 = salmon               | 168 = sandybrown           | 
# 169 = seagreen             | 170 = seashell             | 171 = sienna               | 172 = silver               | 173 = skyblue              | 174 = slateblue            | 175 = slategray            | 
# 176 = snow                 | 177 = springgreen          | 178 = steelblue            | 179 = tan                  | 180 = teal                 | 181 = thistle              | 182 = tomato               | 
# 183 = turquoise            | 184 = violet               | 185 = wheat                | 186 = white                | 187 = whitesmoke           | 188 = yellow               | 189 = yellowgreen          | 
 

%colour_map = (

0  => 186 ,
1  => 170 ,
2  => 107 ,
3  => 186 ,
4  => 170 ,
5  => 128 ,
6  => 186 ,
7  => 170 , 
8  => 107 , 
9  => 186 , 
10 => 170 ,
11 => 107 ,
12 => 186 ,
13 => 170 ,
14 => 107 ,
15 => 186 , 
16 => 170 , 
17 => 154 , 
18 => 161 , 
19 => 122  
) ;

1;
