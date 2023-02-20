load('live_scripts_and_data\starData.mat')

%Calculate the speed of all the stars in the spectra
[sHa,idx] = min(spectra);
lambdaHa = lambda(idx);
z = lambdaHa/656.28 - 1;
speed = z*299792.458;

%Plot the spectra of all seven stars using different 
%line properties for redshifted and blueshifted spectra.
for v = 1:7
    s = spectra(:, v);
    if speed(v) <= 0
        %plots 's' against 'lambda' if the condition is true
        plot(lambda, s, '--')
        hold on
    elseif speed(v) > 0
        %plots 's' against 'lambda' withbold lines if condition is true
        plot(lambda, s, "LineWidth", 3)
    end
    hold on
end
hold off

%Adds legends
legend(starnames)
%stores elements in starnames that are greater than '0' to the array "movaway".
movaway = starnames(speed > 0);

Additional
%Plot without differentiating between redshifted and blueshifted spectra.
plot(lambda, spectra)
legend(starnames)