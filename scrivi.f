      program scrivi
      
      implicit none
      integer indice,i
      real freq,kk,temp

      open(10,file='a.dat',status='old')
      !open(12,file='RLS_t.dat',status='old')
      do i=1,1000000000
         read(10,*,end=90)freq
         kk=(1./100)*i
         write(12,*)kk,freq
      enddo
 90   continue
      
      end program
