page 50113 "Room Booking Items Lines List"
{
    Caption = 'Room Booking Items Lines List';
    PageType = ListPart;
    SourceTable = "Room Booking Item Lines";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No field.';
                }
                field("No of Items"; Rec."No of Items")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Items field.';
                }
                field("Booking No";Rec."Booking No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Booking No field.';
                }
                field("Item Type"; Rec."Item Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Type field.';
                }
                
                field(Item; Rec.Item)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item field.';
                }
            }
        }
    }
}
