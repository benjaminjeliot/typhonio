!
! Crown Copyright 2014 AWE.
!
! This file is part of TyphonIO. 
! Released under the BSD 3-clause license. 
! For more details see license.txt
!

!#define TIO_CHECK( X ) ierr = X; if (ierr .ne. TIO_SUCCESS_F) print *, 'Error:', __LINE__, ierr
subroutine tio_check_error(ierr, line_number)
  use typhonio
  implicit none
  integer, intent(in) :: ierr, line_number
  if (ierr .ne. TIO_SUCCESS_F) then
    print *, 'Error:', line_number, ierr
  end if
end subroutine tio_check_error

program main
  use typhonio
  implicit none

  integer :: ierr
  integer :: i
  character(len=*), parameter :: file_name = "../tio_files/tio_variable.h5"
  integer(kind=TIO_FILEK) :: file_id
  integer(kind=TIO_OBJK) :: state_id
  integer(kind=TIO_OBJK) :: var_id1, var_id2, var_id3
  real(kind=8), dimension(10,10,10) :: vdata

!  TIO_CHECK( TIO_Create_f(file_name, file_id, TIO_ACC_REPLACE_F, "TestCode", "V0.0", "01-01-2000", "Test Title") )
  ierr = TIO_Create_f(file_name, file_id, TIO_ACC_REPLACE_F, "TestCode", "V0.0", "01-01-2000", "Test Title")
  call tio_check_error(ierr, __LINE__)

!  TIO_CHECK( TIO_Create_State_f( file_id, "State1", state_id, 1, 0.0_TIO_TIMEK, "ms" ) )
  ierr = TIO_Create_State_f( file_id, "State1", state_id, 1, 0.0_TIO_TIMEK, "ms" )
  call tio_check_error(ierr, __LINE__)

!  TIO_CHECK( TIO_Create_Variable_f(file_id, state_id, "Variable1", var_id1, TIO_REAL8_F, TIO_3D_F, (/ 10, 10, 10 /), "units") )
  ierr = TIO_Create_Variable_f(file_id, state_id, "Variable1", var_id1, TIO_REAL8_F, TIO_3D_F, (/ 10, 10, 10 /), "units")
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Create_Variable_f(file_id, state_id, "Variable2", var_id2, TIO_REAL8_F, TIO_3D_F, (/ 10, 10, 10 /), "units") )
  ierr = TIO_Create_Variable_f(file_id, state_id, "Variable2", var_id2, TIO_REAL8_F, TIO_3D_F, (/ 10, 10, 10 /), "units")
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Create_Variable_f(file_id, state_id, "Variable3", var_id3, TIO_REAL8_F, TIO_3D_F, (/ 10, 10, 10 /), "units") )
  ierr = TIO_Create_Variable_f(file_id, state_id, "Variable3", var_id3, TIO_REAL8_F, TIO_3D_F, (/ 10, 10, 10 /), "units")
  call tio_check_error(ierr, __LINE__)

  vdata = reshape( (/ (i,i=1,1000) /), (/ 10, 10, 10 /) )
  
!  TIO_CHECK( TIO_Write_Variable_f(file_id, var_id1, TIO_REAL8_F, vdata) )
  ierr  = TIO_Write_Variable_f(file_id, var_id1, TIO_REAL8_F, vdata)
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Write_Variable_f(file_id, var_id2, TIO_REAL8_F, vdata) )
  ierr = TIO_Write_Variable_f(file_id, var_id2, TIO_REAL8_F, vdata)
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Write_Variable_f(file_id, var_id3, TIO_REAL8_F, vdata) )
  ierr = TIO_Write_Variable_f(file_id, var_id3, TIO_REAL8_F, vdata)
  call tio_check_error(ierr, __LINE__)

!  TIO_CHECK( TIO_Close_f(file_id) )
  ierr = TIO_Close_f(file_id)
  call tio_check_error(ierr, __LINE__)

end program main
