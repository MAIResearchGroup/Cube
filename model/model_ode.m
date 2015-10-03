function dy = model_ode(t, x)
    r     = x(1:3);
    v     = x(4:6);
    omega = x(7:9);
    phi   = x(10:12);
    
    mass   = 0.5;
    P      = 1;
    width  = 1;
    height = 1;
    depth  = 1;
    Jxx = (1/12)*mass*(width^2  + depth^2);
    Jyy = (1/12)*mass*(height^2 + depth^2);
    Jzz = (1/12)*mass*(height^2 + width^2);
    J = [Jxx 0  0;
          0 Jyy 0;
          0  0 Jzz];
    
    % Гравитационная сила и момент  
    FG = [0; -1; 0]*9.81*mass;
    MG = cross([0; 0; 0], FG);
    
    % Сила тяги двигателя и момент
    FP = [0;  1; 0]*P;
    MP = cross([0; 0.5; 0.1], FP);
    
    % Сумма сил и моментов
    F = FG + FP;
    M = MG + MP; 
   
    dr_dt     = v;
    dv_dt     = F/mass;
    domega_dt = inv(J)*M - inv(J)*cross(omega, J*omega);
    dphi_dt   = omega;
    
    dy = [dr_dt; dv_dt; domega_dt; dphi_dt];
end    