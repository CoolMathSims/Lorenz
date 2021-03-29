MODULE params

INTEGER, PARAMETER :: ttime = 30
!butterfly parameters
REAL,PARAMETER :: sigma = 10.
REAL, PARAMETER :: rho = 28.0
REAL, PARAMETER :: beta = 8.0/3.0
REAL, PARAMETER :: dt = 0.005
!INTEGER, PARAMETER :: time = 30000
INTEGER, PARAMETER :: time = ttime/dt

REAL :: x(0:time)
REAL :: y(0:time)
REAL :: z(0:time)

!iteration
INTEGER :: i

REAL :: dx,dy,dz,xn,yn,zn

end module params
