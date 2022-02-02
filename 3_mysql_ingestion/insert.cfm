<cfquery name="qAddCustomer" datasource="vandelay-dsn">
    INSERT INTO tCustomers (FirstName, LastName)
    VALUES 
    (
        'David',
        'Bowie'
    )
</cfquery>

<cfquery name="qCustomers" datasource="vandelay-dsn">
    SELECT *
    FROM tCustomers
</cfquery>

<cfdump var="#qCustomers#" />
