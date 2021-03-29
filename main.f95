program Lorenz
USE params
USE sub

REAL :: coords(0:2,0:time)

x(0) = 1.
y(0) = 1.
z(0) = 1.

OPEN(10,file ='coord1.dat',form='formatted')
OPEN(20,file ='coord2.dat',form='formatted')

CALL lorenzEuler
!CALL lorenzRK

do i =0,time
  coords(0,i) = x(i)
  coords(1,i) = y(i)
  coords(2,i) = z(i)
end do

DO i = 0,time
  WRITE(10,'(101F12.6)')(coords(:,i))
  WRITE(6,*)"Data output at time = ",time*dt
end do

x(0) = 1.
y(0) = 5.
z(0) = 1.

CALL lorenzEuler
!CALL lorenzRK

do i =0,time
  coords(0,i) = x(i)
  coords(1,i) = y(i)
  coords(2,i) = z(i)
end do

DO i = 0,time
  WRITE(20,'(101F12.6)')(coords(:,i))
  WRITE(6,*)"Data output at time = ",i*dt
end do


end program Lorenz
