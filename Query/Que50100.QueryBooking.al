query 50100 QueryBooking
{
    Caption = 'QueryBooking';
    QueryType = Normal;
    
    elements
    {
        dataitem(RoomBooking; "Room Booking")
        {
            column(CustomerName; "Customer Name")
            {
            }
            column(CustomerPhoneNo; "Customer Phone No")
            {
            }
            column(CustomerEmail; "Customer Email")
            {
            }
            column(CustomerAddress; "Customer Address")
            {
            }
        }
    }
    
    trigger OnBeforeOpen()
    begin
    
    end;
}
