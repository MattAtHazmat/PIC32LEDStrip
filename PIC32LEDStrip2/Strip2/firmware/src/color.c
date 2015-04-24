/* color.c */
/* Created April 24, 2015 17:20 */

#include <common.h>
#include <color.h>


/******************************************************************************/
HSV_COLOR_TYPE RGBtoHSV(RGB_COLOR_TYPE rgb)
{
    HSV_COLOR_TYPE hsv;

    return hsv;
}
/******************************************************************************/
/* from http://www.easyrgb.com/index.php?X=MATH&H=21#text21 */
/* HSV to RGB */
//if ( S == 0 )                       //HSV from 0 to 1
//{
//   R = V * 255
//   G = V * 255
//   B = V * 255
//}
//else
//{
//   var_h = H * 6
//   if ( var_h == 6 ) var_h = 0      //H must be < 1
//   var_i = int( var_h )             //Or ... var_i = floor( var_h )
//   var_1 = V * ( 1 - S )
//   var_2 = V * ( 1 - S * ( var_h - var_i ) )
//   var_3 = V * ( 1 - S * ( 1 - ( var_h - var_i ) ) )
//
//   if      ( var_i == 0 ) { var_r = V     ; var_g = var_3 ; var_b = var_1 }
//   else if ( var_i == 1 ) { var_r = var_2 ; var_g = V     ; var_b = var_1 }
//   else if ( var_i == 2 ) { var_r = var_1 ; var_g = V     ; var_b = var_3 }
//   else if ( var_i == 3 ) { var_r = var_1 ; var_g = var_2 ; var_b = V     }
//   else if ( var_i == 4 ) { var_r = var_3 ; var_g = var_1 ; var_b = V     }
//   else                   { var_r = V     ; var_g = var_1 ; var_b = var_2 }
//
//   R = var_r * 255                  //RGB results from 0 to 255
//   G = var_g * 255
//   B = var_b * 255
//}
RGB_COLOR_TYPE HSVtoRGB(HSV_COLOR_TYPE hsv)
{
    RGB_COLOR_TYPE rgb;
    
    return rgb;
}

/******************************************************************************/