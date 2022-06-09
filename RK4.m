function [vxn1,vzn1] = RK4 (h,t0,t1,vxi,vzi,D,m)
[k1x,k1z] = differentialProjectileModification(h,t0,t1,vxi,vzi,D,m,2);
[k2x,k2z] = differentialProjectileModification(h,t0+h/2,t1,vxi+k1x*h/2,vzi+k1z*h/2,D,m,2);
[k3x,k3z] = differentialProjectileModification(h,t0+h/2,t1,vxi+k2x*h/2,vzi+k2z*h/2,D,m,2);
[k4x,k4z] = differentialProjectileModification(h,t0+h,t1,vxi+k3x*h,vzi+k3z*h/2,D,m,2);
vxn1=vxi+h/6*(k1x+2*k2x+2*k3x+k4x);
vzn1=vzi+h/6*(k1z+2*k2z+2*k3z+k4z);
end