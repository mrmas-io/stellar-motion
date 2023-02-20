%Project - Stellar Motion
%Load the starData.mat. 
load('live_scripts_and_data\starData.mat');
nObs = size(spectra,1);

%define the measurement parameters.
lambdaStart = 630.02;
lambdaDelta = 0.14;

%Create vector "lambdaEnd" and store the value of the last wavelength in the recorded spectrum.
lambdaEnd = lambdaStart + (nObs - 1)*lambdaDelta;

%Use "lambdaEnd" to get the wavelengths in the spectrum
lambda = lambdaStart:lambdaDelta:lambdaEnd;

%Store column '2' of spectra and store it to variable s.
s = spectra(:, 3);

%Plot the graph and label the x and y axis.
plot(lambda,s, ".-")
xlabel("Wavelength")
ylabel("Intensity")


%Extract the minimum value of 's' and it's index.
[sHa, idx] = min(s);

%use the index of the minimum value of 's' to get the wavelength of the
%hydrogen-alpha.
lambdaHa = lambda(idx);

hold on
%add the point to the existing axis by using the minimum values of 's' and
%the wavwlength of the hydrogen-alpha.
plot(lambdaHa, sHa, 'rs', "MarkerSize", 8)
hold off

%Get the redshift factor and the speed (in km/s) at which the star is moving away from Earth.
speed_of_light = 299792.458;
z = (lambdaHa/656.28) - 1;
speed = z * speed_of_light;
