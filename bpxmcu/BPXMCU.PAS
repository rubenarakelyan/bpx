unit bpxmcu;

{
This is the Borland Pascal eXtensions Measurement Conversion Unit 0.1.2

Authored by Ruben Arakelyan - tools.rubenarakelyan.com/bpx
Released 24 January 2006
Last modified 7 April 2010

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

To implement BPXMCU in your application, simply compile it
then address it in the Pascal "uses" line as follows:
  uses crt, bpxmcu;

For a full history of changes, see CHANGELOG.TXT.
}

interface

function mcucf(f: integer): real;
function mcu(m: real; f: integer): real;

implementation

function mcucf(f: integer): real;
    begin
        case f of
            {Length}
            101 : mcucf := 2.54;       {Inches to Centimetres}
            102 : mcucf := 0.3937;     {Centimetres to Inches}
            103 : mcucf := 0.3048;     {Feet to Metres}
            104 : mcucf := 3.2808;     {Metres to Feet}
            105 : mcucf := 0.9144;     {Yards to Metres}
            106 : mcucf := 1.0936;     {Metres to Yards}
            107 : mcucf := 1.6093;     {Miles to Kilometres}
            108 : mcucf := 0.6213;     {Kilometres to Yards}

            {Area}
            201 : mcucf := 6.4516;     {Square Inches to Square Centimetres}
            202 : mcucf := 0.155;      {Square Centimetres to Square Inches}
            203 : mcucf := 0.0929;     {Square Feet to Square Metres}
            204 : mcucf := 10.7639;    {Square Metres to Square Feet}
            205 : mcucf := 0.8361;     {Square Yards to Square Metres}
            206 : mcucf := 1.1959;     {Square Metres to Square Yards}
            207 : mcucf := 0.4046;     {Acres to Hectares}
            208 : mcucf := 2.471;      {Hectares to Acres}
            209 : mcucf := 2.5899;     {Square Miles to Square Kilometres}
            210 : mcucf := 0.3861;     {Square Kilometres to Square Miles}

            {Volume}
            301 : mcucf := 16.387;     {Cubic Inches to Cubic Centimetres}
            302 : mcucf := 0.06102;    {Cubic Centimetres to Cubic Inches}
            303 : mcucf := 0.02831;    {Cubic Feet to Cubic Metres}
            304 : mcucf := 35.3147;    {Cubic Metres to Cubic Feet}
            305 : mcucf := 0.76455;    {Cubic Yards to Cubic Metres}
            306 : mcucf := 1.30795;    {Cubic Metres to Cubic Yards}

            {Capacity}
            401 : mcucf := 568.26125;  {Pints to Millilitres}
            402 : mcucf := 0.001759;   {Milliletres to Pints}
            403 : mcucf := 4.546;      {Gallons to Litres}
            404 : mcucf := 0.2199;     {Litres to Gallons}

            {Weight}
            501 : mcucf := 28.3495;    {Ounces to Grams}
            502 : mcucf := 0.03527;    {Grams to Ounces}
            503 : mcucf := 453.59;     {Pounds to Grams}
            504 : mcucf := 0.002204;   {Grams to Pounds}
            505 : mcucf := 0.45359;    {Pounds to Kilograms}
            506 : mcucf := 2.2046;     {Kilograms to Pounds}
            507 : mcucf := 1016.0469;  {Tons to Kilograms}
            508 : mcucf := 0.000984;   {Kilograms to Tons}

            {Time}
            601 : mcucf := 0.01;       {Seconds to Jiffys}
            602 : mcucf := 10;         {Jiffys to Seconds}
        else
            mcucf := 1;
        end;
    end;

function mcu(m: real; f: integer): real;
    begin
        mcu := m * mcucf(f);
    end;

end.
