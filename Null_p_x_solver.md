Null_p_x_solver
___________________________________________________________________________
Damit p_x_solver Null wird:
0 = o_1(x, n) - R - (Teil_1_oben/Teil_1_unten) + Teil_2;
R, x, n, x_gewaehlt, p
_________________________
o_1(x, n) =     2/n + log2(nchoosek(n+K-1,K-1))/n - log2(2-1/(x*x'))/n;
R =             R;
Teil_1_oben =   ____sum_k1____q(k1)*vk_1(x, k1, x_i, H_n1, n1, p)
Teil_1_unten =  p * log(2) = 0.6931*p;
Sum_vk_2 =      ____sum_k1____q(k1)*vk_2(x, k1, x_i, H_n1, n1, p)
Teil_2 =        x(x_gewaehlt)*sqrt(2/n*Sum_vk_2) /(p*log(2));
___________________________________________________________________________
Mit Zahlen: R=8, x=x_x, n=40,x_ge=40,p
o_1 = 0.6728       R=8         =>   co_1 = -7.3272
Teil_2 => x(4)/log(2)*sqrt(2/40)  *Sum_vk_2/p = -0.3226(= co_3)*Sum_vk_2/p
=> 0 = co_1 -( Teil_1_oben/(co_2*p) ) + co_3*Sum_vk_2/p