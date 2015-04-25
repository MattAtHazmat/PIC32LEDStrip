/* color.c */
/* Created April 24, 2015 17:20 */

#include <common.h>

/******************************************************************************/
HSV_COLOR_TYPE RGBtoHSV(RGB_COLOR_TYPE rgb)
{
    HSV_COLOR_TYPE hsv;

    return hsv;
}
/******************************************************************************/
/* http://www.easyrgb.com/ */
/* code below adapted from http://web.mit.edu/storborg/Public/hsvtorgb.c */
void HSVtoRGB(HSV_COLOR_TYPE hsv, RGB_COLOR_TYPE *rgb  )
/* HSV to RGB conversion function with only integer math */
{
    uint8_t region, fpart, p, q, t;
    if(hsv.saturation == 0)
    {
        /* color is grayscale */
        rgb->red  = hsv.value;
        rgb->green= hsv.value;
        rgb->blue = hsv.value;
    }
    else
    {
        /* make hue 0-5 */
        region = hsv.hue / 43;
        /* find remainder part, make it from 0-255 */
        fpart = (hsv.hue - (region * 43)) * 6;
        /* calculate temp vars, doing integer multiplication */
        p = (hsv.value * (255 - hsv.saturation)) >> 8;
        q = (hsv.value * (255 - ((hsv.saturation * fpart) >> 8))) >> 8;
        t = (hsv.value * (255 - ((hsv.saturation * (255 - fpart)) >> 8))) >> 8;
        /* assign temp vars based on color cone region */
        switch(region)
        {
            case 0:
            {
                rgb->red = hsv.value;
                rgb->green = t;
                rgb->blue = p;
                break;
            }
            case 1:
            {
                rgb->red = q;
                rgb->green = hsv.value;
                rgb->blue = p;
                break;
            }
            case 2:
            {
                rgb->red = p;
                rgb->green = hsv.value;
                rgb->blue = t;
                break;
            }
            case 3:
            {
                rgb->red = p;
                rgb->green = q;
                rgb->blue = hsv.value;
                break;
            }
            case 4:
            {
                rgb->red = t;
                rgb->green = p;
                rgb->blue = hsv.value;
                break;
            }
            default:
            {
                rgb->red = hsv.value;
                rgb->green = p;
                rgb->blue = q;
                break;
            }
        }
    }
}

/******************************************************************************/