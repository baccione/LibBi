% Copyright (C) 2011
% Author: Lawrence Murray <lawrence.murray@csiro.au>
% $Rev$
% $Date$

% -*- texinfo -*-
% @deftypefn {Function File} plot_obs (@var{in}, @var{invars}, @var{coord}, @var{ns})
%
% Plot observations.
%
% @itemize
% @bullet{ @var{in} Input file. Gives the name of a NetCDF file containing
% observations.}
%
% @bullet{ @var{invar} Name of variable from input file to plot.
%
% @bullet{ @var{coord} (optional) Vector of spatial coordinates of zero
% to three elements, giving the x, y and z coordinates of a
% component of @var{invar} to plot.}
%
% @bullet{ @var{ns} (optional) Index along ns dimension of input file.}
% @end itemize
% @end deftypefn
%
function plot_obs (in, invar, coord, ns)
    % check arguments
    if nargin < 2 || nargin > 4
        print_usage ();
    end
    if nargin == 2
        coord = [];
        ns = 1;
    elseif nargin == 3
        ns = 1;
    else
        if (!isscalar(ns))
            error ('ns must be scalar');
        end
        if (ns < 1)
            error ('ns must be positive');
        end
    end

    % input file
    nci = netcdf(in, 'r');

    % read
    [t y] = read_obs (nci, invar, coord, ns);
        
    % plot
    plot(t, y, 'ok', 'markersize', 3.0);
    %plot_defaults;
    
    ncclose(nci);
end
