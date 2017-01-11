function  [output]  = somOutput( pattern )
    global IW ;
    
    % IW => NxD
    % pattern => Dx1

  output=compet(negdist(IW,pattern'));

end