page 50117 "Room Setup List"
{
    Caption = 'Room Setup List';
    PageType = List;
    SourceTable = "Room Setup Table";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                
                field(RoomDescription; Rec.RoomDescription)
                {

                }
                field(Booked; Rec.Booked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Booked field.';
                }
            }
        }
    }
}
