/*  Functional model for a 74ALS107A negative-edge triggered J-K flip-flop
    with Clear
      NOTE: The default rise and fall time values are used
*/     

module test;
  reg  j,k,cl,ck;                            // inputs
  wire q,qbar;                               // outputs
 
  jkff_74ALS107A U1A(j,k,cl,ck,q,qbar);

  initial ck=0;
  always #100 ck=~ck;

  initial 
  begin
    $monitor($time,,"cl=%b ck=%b j=%b k=%b q=%b qbar=%b",
         cl,ck,j,k,q,qbar);
    #000 cl=1;j=1;k=1;
    #050 cl=0;
    #200 cl=1;
    #200 j=1;k=0;
    #200 j=1;k=0;
    #200 j=0;k=1;
    #200 j=0;k=1;
    #200 j=1;k=1;cl=1;
    #200 j=1;k=1;cl=0;
    #200 cl=0;
    #200 cl=1;
    #750 $finish;
  end
endmodule

