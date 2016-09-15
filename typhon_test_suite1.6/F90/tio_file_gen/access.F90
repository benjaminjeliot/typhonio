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
  integer :: i, j
  character(len=*), parameter :: file_name = "../tio_files/tio_access.h5"
  integer(kind=TIO_FILEK) :: file_id
  integer(kind=TIO_OBJK) :: state_id
  integer(kind=TIO_OBJK) :: mesh_id, quadmesh_id, unstrmesh_id, pointmesh_id
  integer(kind=TIO_OBJK) :: arrayq_id1, arrayq_id2, arrayq_id3
  real(kind=8), dimension(3,16,2,3) :: aqdat
  integer, dimension(1) :: dims1
  integer, dimension(3) :: dims2

!  TIO_CHECK( TIO_Create_f(file_name, file_id, TIO_ACC_REPLACE_F, "TestCode", "V0.0", "01-01-2000", "Test Title") )
ierr = TIO_Create_f(file_name, file_id, TIO_ACC_REPLACE_F, "TestCode", "V0.0", "01-01-2000", "Test Title")
call tio_check_error(ierr, __LINE__)

!  TIO_CHECK( TIO_Create_State_f( file_id, "State1", state_id, 1, 0.0_TIO_TIMEK, "seconds" ) )
ierr = TIO_Create_State_f( file_id, "State1", state_id, 1, 0.0_TIO_TIMEK, "seconds" )
call tio_check_error(ierr, __LINE__)
  
!  TIO_CHECK( TIO_Create_Mesh_f( file_id, state_id, "Mesh", mesh_id,                          &
!       &                        TIO_MESH_POINT_F, TIO_COORD_CARTESIAN_F, .false., "Group1", 1, &
!       &                        TIO_INTEGER4_F, TIO_REAL8_F, TIO_2D_F, 100, 0, 0, 0, 4,                &
!       &                        "mm", "mm", "mm", "x", "y", "z" ) )
ierr = TIO_Create_Mesh_f( file_id, state_id, "Mesh", mesh_id,                          &
       &                        TIO_MESH_POINT_F, TIO_COORD_CARTESIAN_F, .false., "Group1", 1, &
       &                        TIO_INTEGER4_F, TIO_REAL8_F, TIO_2D_F, 100, 0, 0, 0, 4,                &
       &                        "mm", "mm", "mm", "x", "y", "z" )
call tio_check_error(ierr, __LINE__)

!  TIO_CHECK( TIO_Close_f(file_id) )
ierr = TIO_Close_f(file_id)
call tio_check_error(ierr, __LINE__)

end program main
