permissionset 50400 GeneratedPermission
{
    Assignable = true;
    Permissions = tabledata "Lunch Item" = RIMD,
        tabledata "Lunch Item Setup" = RIMD,
        tabledata "Lunch Menu" = RIMD,
        tabledata "Lunch Order Entry" = RIMD,
        table "Lunch Item" = X,
        table "Lunch Item Setup" = X,
        table "Lunch Menu" = X,
        table "Lunch Order Entry" = X,
        report MenuForToday = X,
        codeunit "Lunch Order Menger" = X,
        page "Item Info" = X,
        page "Lunch Item Card" = X,
        page "Lunch Item Picture" = X,
        page "Lunch Item Setup" = X,
        page "Lunch Items" = X,
        page "Lunch Menu" = X,
        page "Lunch Menu Card" = X,
        page "Lunch Order Entries" = X,
        page "Lunch Vendor Card" = X,
        page "Lunch Vendors" = X,
        page LunchOrder = X,
        page "Nutritions Pie Chart" = X;
}