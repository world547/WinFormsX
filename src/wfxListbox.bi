'    WinFormsX - Windows GUI Framework for the FreeBASIC Compiler
'    Copyright (C) 2018 Paul Squires, PlanetSquires Software
'
'    This program is free software: you can redistribute it and/or modify
'    it under the terms of the GNU General Public License as published by
'    the Free Software Foundation, either version 3 of the License, or
'    (at your option) any later version.
'
'    This program is distributed in the hope that it will be useful,
'    but WITHOUT any WARRANTY; without even the implied warranty of
'    MERCHANTABILITY or FITNESS for A PARTICULAR PURPOSE.  See the
'    GNU General Public License for more details.

' ListBox Class
' https://msdn.microsoft.com/en-us/library/system.windows.forms.listbox(v=vs.110).aspx


type wfxListBoxItem
   private:
      _hWindow     as hwnd
      _Index       as Long
      _Text        as CWSTR
      _Data32      as Long 
      _Selected    as boolean
     
   public:
      Declare Property hWindow() As hwnd
      Declare Property hWindow( ByVal nValue As hwnd)
      Declare Property Index() As long
      Declare Property Index( ByVal nValue As long)
      Declare Property Selected() As boolean
      Declare Property Selected( ByVal nValue As boolean)
      declare property Text() as CWSTR
      declare property Text( byref wszValue as wstring )
      Declare Property Data32() As long
      Declare Property Data32( ByVal nValue As long)
END TYPE

type wfxListBoxItemsCollection
   private:
      _hWindow     as hwnd
      _Collection As wfxLList
      
   public:
      Declare Property hWindow() As hwnd
      Declare Property hWindow( ByVal nValue As hwnd)
      Declare function Clear() as long 
      Declare function Count() as long 
      Declare function Remove( byval nIndex as long ) as long 
      declare function Add() as long
      declare function ByIndex( byval nIndex as long ) byref as wfxListBoxItem
      Declare Constructor
      declare destructor 
END TYPE

Type wfxListBox Extends wfxControl
   private:
      _TempItem as wfxListBoxItem
      _AllowSelection as boolean = true
      _BorderStyle as FormBorderStyle = FormBorderStyle.Fixed3D
      _ColumnWidth as long
      _IntegralHeight as boolean
      _MultiColumn as boolean
      _SelectionMode as ListBoxSelectionMode = ListBoxSelectionMode.One
      _ScrollAlwaysVisible as boolean
      _SelectedItem as wfxListBoxItem
      _SelectedIndex as Long = -1
      _Sorted as boolean
      _TopIndex as Long
      _ItemsCollection as wfxListBoxItemsCollection
      _IsLoading as Boolean = true   ' internal
      
   Public:
      Declare function Item( byval nIndex as long) byref as wfxListBoxItem
      declare function Items byref As wfxListBoxItemsCollection
      Declare Property AllowSelection() As boolean
      Declare Property BorderStyle() As FormBorderStyle
      Declare Property BorderStyle( ByVal nValue As FormBorderStyle )
      Declare Property ColumnWidth() As long
      Declare Property ColumnWidth( ByVal nValue As long)
      Declare Property IntegralHeight() As boolean
      Declare Property IntegralHeight( ByVal nValue As boolean)
      Declare Property MultiColumn() As boolean
      Declare Property MultiColumn( ByVal nValue As boolean)
      Declare Property SelectionMode() As ListBoxSelectionMode
      Declare Property SelectionMode( ByVal nValue As ListBoxSelectionMode)
      Declare Property ScrollAlwaysVisible() As boolean
      Declare Property ScrollAlwaysVisible( ByVal nValue As boolean)
      Declare Property SelectedItem(byref as wfxListBoxItem) 
      Declare Property SelectedItem() byref as wfxListBoxItem
      Declare Property SelectedIndex() As long
      Declare Property SelectedIndex( ByVal nValue As long)
      Declare Property Sorted() As boolean
      Declare Property Sorted( ByVal nValue As boolean)
      Declare Property TopIndex() As long
      Declare Property TopIndex( ByVal nValue As long)
      
      Declare Constructor( byref wszName as wstring = "" )
      declare function Show(byval hWndParent as hwnd = 0) as long override

      declare function SelectedCount() as Long
      
      ' ClearSelected   (unselects all items in the listbox)
      ' FindString
      ' FindStringExact
      ' BeginUpdate
      ' EndUpdate
      ' GetItemHeight
      ' GetItemRectangle
      
      ' GetSelected(int32)  t/f the item is selected
      ' SetSelected(Int32, Boolean)
      ' IndexFromPoint
      
      
      OnAllEvents        as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
      OnDestroy          as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
      OnClick            as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
      OnMouseMove        as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
      OnMouseDown        as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
      OnMouseUp          as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
      OnMouseDoubleClick as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
      OnMouseEnter       as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
      OnMouseHover       as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
      OnMouseLeave       as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
      OnGotFocus         as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
      OnLostFocus        as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
      OnKeyDown          as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
      OnKeyUp            as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
      OnKeyPress         as function( byref sender as wfxListBox, byref e as EventArgs ) as LRESULT
End Type

