--*********************************************************************
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
-- 02111-1307, USA.
--
-- ©2011 - X Engineering Software Systems Corp. (www.xess.com)
--*********************************************************************

--*********************************************************************
-- Button scanner test displays the number of the pressed button
-- (1, 2, 3, ..., A, B, C) on the first digit of the LED display.
--*********************************************************************

library IEEE, XESS;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use XESS.CommonPckg.all;
use XESS.LedDigitsPckg.all;

entity ButtonTest is
  generic (
    FREQ_G : real := 12.0               -- Operating frequency in MHz.
    );
  port (
    clk_i  : in    std_logic;
    btn_i  : in    std_logic_vector(8 downto 1);
    led_io : inout std_logic_vector(7 downto 0)
    );
end entity;

architecture arch of ButtonTest is
  signal ledDigit_s : std_logic_vector(6 downto 0);
begin

  process(btn_i)
  begin
    case btn_i is
      when "11111110" => ledDigit_s <= CONV_STD_LOGIC_VECTOR(1, ledDigit_s'length);
      when "11111101" => ledDigit_s <= CONV_STD_LOGIC_VECTOR(2, ledDigit_s'length);
      when "11111011" => ledDigit_s <= CONV_STD_LOGIC_VECTOR(3, ledDigit_s'length);
      when "11110111" => ledDigit_s <= CONV_STD_LOGIC_VECTOR(4, ledDigit_s'length);
      when "11101111" => ledDigit_s <= CONV_STD_LOGIC_VECTOR(5, ledDigit_s'length);
      when "11011111" => ledDigit_s <= CONV_STD_LOGIC_VECTOR(6, ledDigit_s'length);
      when "10111111" => ledDigit_s <= CONV_STD_LOGIC_VECTOR(7, ledDigit_s'length);
      when "01111111" => ledDigit_s <= CONV_STD_LOGIC_VECTOR(8, ledDigit_s'length);
      when others     => ledDigit_s <= CONV_STD_LOGIC_VECTOR(16#2d#, ledDigit_s'length);
    end case;
  end process;

  uLeds : LedDigitsDisplay
    generic map(
      FREQ_G => FREQ_G
      )
    port map (
      clk_i        => clk_i,
      ledDigit1_i  => CharToLedDigit(ledDigit_s),
      ledDrivers_o => led_io
      );

end architecture;

