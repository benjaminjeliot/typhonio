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
  character(len=*), parameter :: file_name = "../tio_files/tio_utils.h5"
  integer(kind=TIO_FILEK) :: file_id
  integer(kind=TIO_OBJK) :: state_id1, state_id2, state_id3
  integer(kind=TIO_OBJK) :: vargroup_id1, vargroup_id2, vargroup_id3
  integer(kind=TIO_OBJK) :: var_id1, var_id2, var_id3
  integer(kind=TIO_OBJK) :: material_id1, material_id2, material_id3
  integer(kind=TIO_OBJK) :: mesh_id1, mesh_id2, mesh_id3
  integer(kind=TIO_OBJK) :: quant_id1, quant_id2, quant_id3
  integer(kind=TIO_OBJK) :: arrayq_id1, arrayq_id2, arrayq_id3
  integer(kind=TIO_OBJK) :: surf_id1, surf_id2, surf_id3
  integer(kind=TIO_OBJK) :: nodeset_id1, nodeset_id2, nodeset_id3
  real(kind=8), dimension(10) :: icoords, jcoords, kcoords
  real(kind=8), dimension(9) :: uicoords, ujcoords, ukcoords
  integer(kind=4), dimension(9) :: nodeIDs
  integer(kind=4), dimension(4) :: cellIDs
  integer(kind=4), dimension(16) :: connectivity
  integer(kind=4), dimension(10) :: mat
  integer(kind=4), dimension(9) :: umat

!  TIO_CHECK( TIO_Create_f(file_name, file_id, TIO_ACC_REPLACE_F, "TestCode", "V0.0", "01-01-2000", "Test Title") )
  ierr = TIO_Create_f(file_name, file_id, TIO_ACC_REPLACE_F, "TestCode", "V0.0", "01-01-2000", "Test Title")
  call tio_check_error(ierr, __LINE__)

!======================================================================================================================
! STATES

!  TIO_CHECK( TIO_Create_State_f( file_id, "State1", state_id1, 1, 0.0_TIO_TIMEK, "ms" ) )
  ierr = TIO_Create_State_f( file_id, "State1", state_id1, 1, 0.0_TIO_TIMEK, "ms" )
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Create_State_f( file_id, "State2", state_id2, 2, 1.0_TIO_TIMEK, "ms" ) )
  ierr = TIO_Create_State_f( file_id, "State2", state_id2, 2, 1.0_TIO_TIMEK, "ms" )
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Create_State_f( file_id, "State3", state_id3, 3, 2.0_TIO_TIMEK, "ms" ) )
  ierr = TIO_Create_State_f( file_id, "State3", state_id3, 3, 2.0_TIO_TIMEK, "ms" )
  call tio_check_error(ierr, __LINE__)

!======================================================================================================================
! VARIABLES

!  TIO_CHECK( TIO_Create_Vargroup_f(file_id, state_id1, "VarGroup1", vargroup_id1) )
  ierr = TIO_Create_Vargroup_f(file_id, state_id1, "VarGroup1", vargroup_id1)
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Create_Vargroup_f(file_id, state_id1, "VarGroup2", vargroup_id2) )
  ierr = TIO_Create_Vargroup_f(file_id, state_id1, "VarGroup2", vargroup_id2)
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Create_Vargroup_f(file_id, state_id1, "VarGroup3", vargroup_id3) )
  ierr = TIO_Create_Vargroup_f(file_id, state_id1, "VarGroup3", vargroup_id3)
  call tio_check_error(ierr, __LINE__)

!  TIO_CHECK( TIO_Create_Variable_f(file_id, state_id1, "Variable1", var_id1, TIO_REAL8_F, TIO_2D_F, (/ 2, 2 /), "mm") )
  ierr = TIO_Create_Variable_f(file_id, state_id1, "Variable1", var_id1, TIO_REAL8_F, TIO_2D_F, (/ 2, 2 /), "mm")
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Create_Variable_f(file_id, state_id1, "Variable2", var_id2, TIO_REAL8_F, TIO_2D_F, (/ 2, 2 /), "mm") )
  ierr = TIO_Create_Variable_f(file_id, state_id1, "Variable2", var_id2, TIO_REAL8_F, TIO_2D_F, (/ 2, 2 /), "mm")
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Create_Variable_f(file_id, state_id1, "Variable3", var_id3, TIO_REAL8_F, TIO_2D_F, (/ 2, 2 /), "mm") )
  ierr = TIO_Create_Variable_f(file_id, state_id1, "Variable3", var_id3, TIO_REAL8_F, TIO_2D_F, (/ 2, 2 /), "mm")
  call tio_check_error(ierr, __LINE__)

!======================================================================================================================
! MESHES

!  TIO_CHECK( TIO_Create_Mesh_f( file_id, state_id1, "Mesh1", mesh_id1,                         &
!       &                        TIO_MESH_UNSTRUCT_F, TIO_COORD_CARTESIAN_F, .false., "Group1", 1, &
!       &                        TIO_INTEGER4_F, TIO_REAL8_F, TIO_3D_F, 9, 4, 1, 16, 1,          &
!       &                        "mm", "mm", "mm", "x", "y", "z" ) )
  ierr = TIO_Create_Mesh_f( file_id, state_id1, "Mesh1", mesh_id1,                         &
       &                        TIO_MESH_UNSTRUCT_F, TIO_COORD_CARTESIAN_F, .false., "Group1", 1, &
       &                        TIO_INTEGER4_F, TIO_REAL8_F, TIO_3D_F, 9, 4, 1, 16, 1,          &
       &                        "mm", "mm", "mm", "x", "y", "z" )
  call tio_check_error(ierr, __LINE__)

!  TIO_CHECK( TIO_Create_Mesh_f( file_id, state_id1, "Mesh2", mesh_id2,                         &
!       &                        TIO_MESH_POINT_F, TIO_COORD_CARTESIAN_F, .false., "Group1", 1, &
!       &                        TIO_INTEGER4_F, TIO_REAL8_F, TIO_3D_F, 10, 0, 0, 0, 1,          &
!       &                        "mm", "mm", "mm", "x", "y", "z" ) )
  ierr = TIO_Create_Mesh_f( file_id, state_id1, "Mesh2", mesh_id2,                         &
       &                        TIO_MESH_POINT_F, TIO_COORD_CARTESIAN_F, .false., "Group1", 1, &
       &                        TIO_INTEGER4_F, TIO_REAL8_F, TIO_3D_F, 10, 0, 0, 0, 1,          &
       &                        "mm", "mm", "mm", "x", "y", "z" )
  call tio_check_error(ierr, __LINE__)

!  TIO_CHECK( TIO_Create_Mesh_f( file_id, state_id1, "Mesh3", mesh_id3,                         &
!       &                        TIO_MESH_QUAD_NONCOLINEAR_F, TIO_COORD_CARTESIAN_F, .false., "Group1", 1, &
!       &                        TIO_INTEGER4_F, TIO_REAL8_F, TIO_3D_F, 10, 10, 10, 0, 1,          &
!       &                        "mm", "mm", "mm", "x", "y", "z" ) )
  ierr = TIO_Create_Mesh_f( file_id, state_id1, "Mesh3", mesh_id3,                         &
       &                        TIO_MESH_QUAD_NONCOLINEAR_F, TIO_COORD_CARTESIAN_F, .false., "Group1", 1, &
       &                        TIO_INTEGER4_F, TIO_REAL8_F, TIO_3D_F, 10, 10, 10, 0, 1,          &
       &                        "mm", "mm", "mm", "x", "y", "z" )
  call tio_check_error(ierr, __LINE__)

!  TIO_CHECK( TIO_Set_Unstr_Chunk_f(file_id, mesh_id1, 1, TIO_3D_F, 9, 4, 1, 16, 0, 0, 0, 0, 0, 0) )
  ierr = TIO_Set_Unstr_Chunk_f(file_id, mesh_id1, 1, TIO_3D_F, 9, 4, 1, 16, 0, 0, 0, 0, 0, 0)
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Set_Point_Chunk_f(file_id, mesh_id2, 1, TIO_3D_F, 1, 10, 0) )
  ierr = TIO_Set_Point_Chunk_f(file_id, mesh_id2, 1, TIO_3D_F, 1, 10, 0)
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Set_Quad_Chunk_f(file_id, mesh_id3, 1, TIO_3D_F, 1, 10, 1, 10, 1, 10, 0, 0) )
  ierr = TIO_Set_Quad_Chunk_f(file_id, mesh_id3, 1, TIO_3D_F, 1, 10, 1, 10, 1, 10, 0, 0)
  call tio_check_error(ierr, __LINE__)
  
  nodeIDs      = (/ (i,i=1,9) /) 
  cellIDs      = (/ (i,i=1,4) /)
  connectivity = (/ (i,i=1,16) /)
  uicoords     = (/ (i,i=1,9) /)
  ujcoords     = (/ (i,i=1,9) /)
  ukcoords     = (/ (i,i=1,9) /)

!  TIO_CHECK( TIO_Write_UnstrMesh_Chunk_f(file_id, mesh_id1, 1, TIO_XFER_COLLECTIVE_F, TIO_INTEGER4_F, TIO_REAL8_F, &
!        &                                nodeIDs, cellIDs, (/ TIO_SHAPE_QUAD4_F /), (/ 4 /), connectivity, &
!        &                                uicoords, ujcoords, ukcoords) )
  ierr = TIO_Write_UnstrMesh_Chunk_f(file_id, mesh_id1, 1, TIO_XFER_COLLECTIVE_F, TIO_INTEGER4_F, TIO_REAL8_F, &
        &                                nodeIDs, cellIDs, (/ TIO_SHAPE_QUAD4_F /), (/ 4 /), connectivity, &
        &                                uicoords, ujcoords, ukcoords)
  call tio_check_error(ierr, __LINE__)

  icoords = (/ (i,i=1,10) /)
  jcoords = (/ (i,i=1,10) /)
  kcoords = (/ (i,i=1,10) /)

!  TIO_CHECK( TIO_Write_PointMesh_Chunk_f(file_id, mesh_id2, 1, TIO_XFER_COLLECTIVE_F, TIO_REAL8_F, icoords, jcoords, kcoords) )
  ierr = TIO_Write_PointMesh_Chunk_f(file_id, mesh_id2, 1, TIO_XFER_COLLECTIVE_F, TIO_REAL8_F, icoords, jcoords, kcoords)
  call tio_check_error(ierr, __LINE__)

!  TIO_CHECK( TIO_Write_QuadMesh_Chunk_f(file_id, mesh_id3, 1, TIO_XFER_COLLECTIVE_F, TIO_REAL8_F, icoords, jcoords, kcoords) )
  ierr = TIO_Write_QuadMesh_Chunk_f(file_id, mesh_id3, 1, TIO_XFER_COLLECTIVE_F, TIO_REAL8_F, icoords, jcoords, kcoords)
  call tio_check_error(ierr, __LINE__)

!======================================================================================================================
! MATERIALS

!  TIO_CHECK( TIO_Create_Mat_f(file_id, mesh_id1, "Material1", material_id1, TIO_INTEGER4_F, 3, TIO_GHOSTS_NONE_F, .false.) )
  ierr = TIO_Create_Mat_f(file_id, mesh_id1, "Material1", material_id1, TIO_INTEGER4_F, 3, TIO_GHOSTS_NONE_F, .false.)
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Create_Mat_f(file_id, mesh_id2, "Material2", material_id2, TIO_INTEGER4_F, 3, TIO_GHOSTS_NONE_F, .false.) )
  ierr = TIO_Create_Mat_f(file_id, mesh_id2, "Material2", material_id2, TIO_INTEGER4_F, 3, TIO_GHOSTS_NONE_F, .false.)
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Create_Mat_f(file_id, mesh_id3, "Material3", material_id3, TIO_INTEGER4_F, 3, TIO_GHOSTS_NONE_F, .false.) )
  ierr = TIO_Create_Mat_f(file_id, mesh_id3, "Material3", material_id3, TIO_INTEGER4_F, 3, TIO_GHOSTS_NONE_F, .false.)
  call tio_check_error(ierr, __LINE__)

!  TIO_CHECK( TIO_Set_Mat_Range_f(file_id, material_id1, TIO_INTEGER4_F, 3, (/ 1, 2, 3 /), (/ "Mat1", "Mat2", "Mat3" /)) )
  ierr = TIO_Set_Mat_Range_f(file_id, material_id1, TIO_INTEGER4_F, 3, (/ 1, 2, 3 /), (/ "Mat1", "Mat2", "Mat3" /))
  call tio_check_error(ierr, __LINE__)

  mat  = (/ 1, 1, 1, 2, 2, 2, 3, 3, 3, 3 /)
  umat = (/ 1, 1, 1, 2, 2, 2, 3, 3, 3  /)

!  TIO_CHECK( TIO_Write_UnstrMat_Chunk_f(file_id, material_id1, 1, TIO_XFER_COLLECTIVE_F, TIO_INTEGER4_F, mat) )
  ierr = TIO_Write_UnstrMat_Chunk_f(file_id, material_id1, 1, TIO_XFER_COLLECTIVE_F, TIO_INTEGER4_F, mat)
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Write_PointMat_Chunk_f(file_id, material_id2, 1, TIO_XFER_COLLECTIVE_F, TIO_INTEGER4_F, mat) )
  ierr = TIO_Write_PointMat_Chunk_f(file_id, material_id2, 1, TIO_XFER_COLLECTIVE_F, TIO_INTEGER4_F, mat)
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Write_QuadMat_Chunk_f(file_id, material_id3, 1, TIO_XFER_COLLECTIVE_F, TIO_INTEGER4_F, mat) )
  ierr = TIO_Write_QuadMat_Chunk_f(file_id, material_id3, 1, TIO_XFER_COLLECTIVE_F, TIO_INTEGER4_F, mat)
  call tio_check_error(ierr, __LINE__)

!======================================================================================================================
! QUANTS

!  TIO_CHECK( TIO_Create_Quant_f(file_id, mesh_id1, "Quant1", quant_id1, TIO_INTEGER4_F, &
!        &                       TIO_CENTRE_NODE_F, 0, .false., "node") )
  ierr = TIO_Create_Quant_f(file_id, mesh_id1, "Quant1", quant_id1, TIO_INTEGER4_F, &
        &                       TIO_CENTRE_NODE_F, 0, .false., "node")
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Create_Quant_f(file_id, mesh_id1, "Quant2", quant_id2, TIO_INTEGER4_F, &
!        &                        TIO_CENTRE_NODE_F, 0, .false., "node") )
  ierr = TIO_Create_Quant_f(file_id, mesh_id1, "Quant2", quant_id2, TIO_INTEGER4_F, &
        &                        TIO_CENTRE_NODE_F, 0, .false., "node")
  call tio_check_error(ierr, __LINE__)
!  TIO_CHECK( TIO_Create_Quant_f(file_id, mesh_id1, "Quant3", quant_id3, TIO_INTEGER4_F, &
!        &                       TIO_CENTRE_NODE_F, 0, .false., "node") )
  ierr = TIO_Create_Quant_f(file_id, mesh_id1, "Quant3", quant_id3, TIO_INTEGER4_F, &
        &                       TIO_CENTRE_NODE_F, 0, .false., "node")
  call tio_check_error(ierr, __LINE__)

!!  TIO_CHECK( TIO_Create_ArrayQ_f(file_id, mesh_id1, "ArrayQ1", arrayq_id1, TIO_REAL8_F, &
!!        &                        TIO_1D_F, (/ 1 /), TIO_1D_F, TIO_CENTRE_NODE_F, 0, "mm") )
!  ierr = TIO_Create_ArrayQ_f(file_id, mesh_id1, "ArrayQ1", arrayq_id1, TIO_REAL8_F, &
!        &                        TIO_1D_F, (/ 1 /), TIO_1D_F, TIO_CENTRE_NODE_F, 0, "mm")
!  call tio_check_error(ierr, __LINE__)
!!  TIO_CHECK( TIO_Create_ArrayQ_f(file_id, mesh_id1, "ArrayQ2", arrayq_id2, TIO_REAL8_F, &
!!        &                        TIO_1D_F, (/ 1 /), TIO_1D_F, TIO_CENTRE_NODE_F, 0, "mm") )
!  ierr = TIO_Create_ArrayQ_f(file_id, mesh_id1, "ArrayQ2", arrayq_id2, TIO_REAL8_F, &
!        &                        TIO_1D_F, (/ 1 /), TIO_1D_F, TIO_CENTRE_NODE_F, 0, "mm")
!  call tio_check_error(ierr, __LINE__)
!!  TIO_CHECK( TIO_Create_ArrayQ_f(file_id, mesh_id1, "ArrayQ3", arrayq_id3, TIO_REAL8_F, &
!!        &                        TIO_1D_F, (/ 1 /), TIO_1D_F, TIO_CENTRE_NODE_F, 0, "mm") )
!  ierr = TIO_Create_ArrayQ_f(file_id, mesh_id1, "ArrayQ3", arrayq_id3, TIO_REAL8_F, &
!        &                        TIO_1D_F, (/ 1 /), TIO_1D_F, TIO_CENTRE_NODE_F, 0, "mm")
!  call tio_check_error(ierr, __LINE__)

!======================================================================================================================
! SURFACE

!!  TIO_CHECK( TIO_Create_Surface_f(file_id, mesh_id1, "Surface1", surf_id1, TIO_INTEGER4_F, 10) )
!  ierr = TIO_Create_Surface_f(file_id, mesh_id1, "Surface1", surf_id1, TIO_INTEGER4_F, 10)
!  call tio_check_error(ierr, __LINE__)
!!  TIO_CHECK( TIO_Create_Surface_f(file_id, mesh_id1, "Surface2", surf_id2, TIO_INTEGER4_F, 10) )
!  ierr = TIO_Create_Surface_f(file_id, mesh_id1, "Surface2", surf_id2, TIO_INTEGER4_F, 10)
!  call tio_check_error(ierr, __LINE__)
!!  TIO_CHECK( TIO_Create_Surface_f(file_id, mesh_id1, "Surface3", surf_id3, TIO_INTEGER4_F, 10) )
!  ierr = TIO_Create_Surface_f(file_id, mesh_id1, "Surface3", surf_id3, TIO_INTEGER4_F, 10)
!  call tio_check_error(ierr, __LINE__)

!======================================================================================================================
! NODESET

!!  TIO_CHECK( TIO_Create_Nodeset_f(file_id, mesh_id1, "NodeSet1", nodeset_id1, TIO_INTEGER4_F, 10) )
!  ierr = TIO_Create_Nodeset_f(file_id, mesh_id1, "NodeSet1", nodeset_id1, TIO_INTEGER4_F, 10)
!  call tio_check_error(ierr, __LINE__)
!!  TIO_CHECK( TIO_Create_Nodeset_f(file_id, mesh_id1, "NodeSet2", nodeset_id2, TIO_INTEGER4_F, 10) )
!  ierr = TIO_Create_Nodeset_f(file_id, mesh_id1, "NodeSet2", nodeset_id2, TIO_INTEGER4_F, 10)
!  call tio_check_error(ierr, __LINE__)
!!  TIO_CHECK( TIO_Create_Nodeset_f(file_id, mesh_id1, "NodeSet3", nodeset_id3, TIO_INTEGER4_F, 10) )
!  ierr = TIO_Create_Nodeset_f(file_id, mesh_id1, "NodeSet3", nodeset_id3, TIO_INTEGER4_F, 10)
!  call tio_check_error(ierr, __LINE__)

!======================================================================================================================
 
!  TIO_CHECK( TIO_Close_f(file_id) )
  ierr = TIO_Close_f(file_id)
  call tio_check_error(ierr, __LINE__)

end program main
