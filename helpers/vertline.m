function vertline(x,colspec)

my_lim = ylim();
hold on;
y_min = my_lim(1);
y_max = my_lim(2);

plot([x,x],[y_min,y_max],colspec);

end







