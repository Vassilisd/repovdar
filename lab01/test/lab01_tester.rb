#!/usr/bin/env ruby

require './mips_tester'

if  File.exists?("/usr/home/grads/courses/myy402/bin/Mars4_5.jar")
    # This is the path to Mars4_5.jar for the lab machines.
    # It is also used for automatic testing when pushing to GitHub
    tester = MIPSTester::MIPS.new :mars_path => "/usr/home/grads/courses/myy402/bin/Mars4_5.jar"
else 
    ##########################################
    # This is my set-up for my laptop,
    # MODIFY FOR YOUR PERSONAL COMPUTER SETUP!
    #  USING THE FULL PATH TO Mars4_5.jar IN YOUR COMPUTER
    # Do not change the path in line 8. It is 
    #  for automatic testing.
    ##########################################
    tester = MIPSTester::MIPS.new :mars_path => "C:\\Users\\Vassilis\\Downloads/Mars4_5.jar"
end


tester.test "../lab01.asm" do
  # The expected register values at the end of execution are placed here
  expect :s0 => 0xffffffff, :s1 => 0x00ff, :s2 => 0x1001002c, :t0 => 0x10010050,
		  '0x10010024' => 0x000008c1, '0x10010038' => 0x000008c1, '0x1001003c' => 0x10010028
  verbose! # Optional verbosity!
end
