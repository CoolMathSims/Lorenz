MODULE sub
use params

CONTAINS

subroutine lorenzEuler

  REAL :: xcoord
  REAL :: ycoord
  REAL :: zcoord



  do i = 1,time
    xcoord = x(i-1)
    ycoord = y(i-1)
    zcoord = z(i-1)

    dx = sigma*(ycoord-xcoord)*dt
    dy = (xcoord*(rho-zcoord)-ycoord)*dt
    dz = (xcoord*ycoord - beta*zcoord)*dt

    xn = xcoord + dx
    yn = ycoord + dy
    zn = zcoord + dz

    x(i) = xn
    y(i) = yn
    z(i) = zn
  end do

end subroutine lorenzEuler



subroutine lorenzRK
  REAL :: xcoord
  REAL :: ycoord
  REAL :: zcoord
  REAL :: k1,k2,k3,k4



  do i = 1,time

    xcoord = x(i-1)
    ycoord = y(i-1)
    zcoord = z(i-1)

    k1 = sigma*(ycoord-xcoord)
    k2 = sigma*((ycoord+dt*k1/2.)-(xcoord+dt*k1/2.))!*(dt*1.5)
    k3 = sigma*((ycoord+dt*k2/2.)-(xcoord+dt*k2/2.))!*(dt*1.5)
    k4 = sigma*((ycoord+dt*k3)-(xcoord+dt*k3))!*(dt*2)
    dx = dt*(k1 + 2*k2 + 2*k3 + k4)/6.
    xn = xcoord + dx

    k1 = (xcoord*(rho-zcoord)-ycoord)
    k2 = ((xcoord+dt*k1/2.)*(rho-zcoord+dt*k1/2.)-(ycoord+dt*k1/2.))!*(dt*1.5)
    k3 = ((xcoord+dt*k2/2.)*(rho-zcoord+dt*k2/2.)-(ycoord+dt*k2/2.))!*(dt*1.5)
    k4 = ((xcoord+dt*k3)*(rho-zcoord+dt*k3)-(ycoord+dt*k3))!*(dt+dt)
    dy = dt*(k1 + 2*k2 + 2*k3 + k4)/6.
    yn = ycoord + dy

    k1 = (xcoord*ycoord - beta*zcoord)
    k2 = ((xcoord+dt*k1/2.)*(ycoord+dt*k1/2.) - beta*(zcoord+dt*k1/2.))!*(dt*1.5)
    k3 = ((xcoord+dt*k2/2.)*(ycoord+dt*k2/2.) - beta*(zcoord+dt*k2/2.))!*(dt*1.5)
    k4 = ((xcoord+dt*k3)*(ycoord+dt*k3) - beta*(zcoord+dt*k3))!*(dt*2)
    dz = dt*(k1 + 2*k2 + 2*k3 + k4)/6.
    zn = zcoord + dz

    x(i) = xn
    y(i) = yn
    z(i) = zn
  end do

end subroutine lorenzRK


end MODULE sub
