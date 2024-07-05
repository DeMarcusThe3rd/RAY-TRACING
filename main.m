clear variables;
% Constants
 f = 2.4 * 10^9; % adjust as needed
 c = 3 * 10^8;
 beta = 2 * pi * f / c;
 rf1 = 1;
 rf2 = 3;
 % Transmitter and receiver coordinates
 tx = 0; ty = 4; tz = 2; % Transmitter
 rx = 10; ry = 3; rz = 2; % Receiver
 rxv = rx:.01:22; % Simulation range
 % Direct ray
 rd = sqrt(((rxv - tx).^2) + ((ry - ty)^2) + ((rz - tz)^2)); %direct ray
 Ed = (1./rd) .* exp(-1i * beta * rd); %electric field strength
 Edf = 20 * log10(abs(Ed)); %convert to db
 plot(rxv, Edf);
 xlabel('Line Segment "pq" / m'),ylabel('E-field / dB')
 hold on
% Initialize arrays
Ep = zeros(4, 1201);
Epf = zeros(4, 1201);
% First Order
[Ef1_1, Ef2_1] = calculateEfield(1,8,-4);
Ep(1,:) = Ed + Ef1_1 + Ef2_1; %total electric field strength
Epf(1,:) = 20 * log10(abs(Ep(1,:))); %convert to db
plot(rxv, Epf(1,:));
% Second Order
[ Ef1_2, Ef2_2] = calculateEfield(2,16,-8);
Ep(2,:) = Ed + Ef1_1 + Ef2_1 + Ef1_2 + Ef2_2; %total electric field strength
Epf(2,:) = 20 * log10(abs(Ep(2,:))); %convert to db
plot(rxv, Epf(2,:));
% Third Order
[ Ef1_3, Ef2_3] = calculateEfield(3,20,-16);
Ep(3,:) = Ed + Ef1_1 + Ef2_1 + Ef1_2 + Ef2_2 + Ef1_3 + Ef2_3; %total electric
field strength
Epf(3,:) = 20 * log10(abs(Ep(3,:))); %convert to db
plot(rxv, Epf(3,:));
% Fourth Order
[ Ef1_4, Ef2_4] = calculateEfield(4,28,-20);
Ep(4,:) = Ed + Ef1_1 + Ef2_1 + Ef1_2 + Ef2_2 + Ef1_3 + Ef2_3 + Ef1_4 +
Ef2_4; %total electric field strength
Epf(4,:) = 20 * log10(abs(Ep(4,:))); %convert to db
plot(rxv, Epf(4,:));
hold off
% Add legends
legend('Direct Ray', 'First Order', 'Second Order', 'Third Order', 'Fourth
Order');
