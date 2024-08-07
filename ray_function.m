function [Ef, Ef2] = calculateEfield(n,iy,iy2)

   % Constants
   f = 2.4 * 10^9; % adjust as needed
   c = 3 * 10^8;
   beta = 2 * pi * f / c;
   rf1 = 1;
   rf2 = 3;
   
 % Transmitter,receiver and image coordinates
    ix = 0 ;ix2 = 0; %image x top and bottom
    iz = 2; iz2 = 2; %image z top and bottom
    tx = 0; ty = 4; tz = 2; %Transmitter
    rx = 10; ry = 3; rz = 2; %Receiver
    rxv = rx:.01:22; % Simulation range
    
 % Top to rx reflection
 % Finding angle
 d = sqrt(((ix - rxv).^2) + ((iy - ry)^2) + ((iz - rz)^2)); %distance travelled by the reflected rays
 iangle = asin(rxv./d); %find incident angle
 tangle = asin(sin(iangle)./sqrt(rf2/rf1)); %find transmission angle
 
 % Finding field strength
 rcof = (cos(iangle)-sqrt(rf2/rf1).*cos(tangle))./(cos(iangle)+sqrt(rf2/rf1).*cos(tangle)); %finding reflective coefficients
 Ef(1,:) = ((1./d) .* exp(-1i * beta * d)).*rcof.^n; %find electric field strength for the particular order only
 
 % Bottom to rx reflection
 d2 = sqrt(((ix2 - rxv).^2) + ((iy2 - ry)^2) + ((iz2 - rz)^2));
 iangle2 = asin(rxv./d2);
 tangle2 = asin(sin(iangle2)./sqrt(rf2/rf1));
 
 % Finding field strength
 rcof2 = (cos(iangle2)-sqrt(rf2/rf1).*cos(tangle2))./(cos(iangle2)+sqrt(rf2/rf1).*cos(tangle2));
 Ef2(1,:) = ((1./d2) .* exp(-1i * beta * d2)).*rcof2.^n;
end
