<cfquery name="qCustomers" datasource="vandelay-dsn">
    SELECT *
    FROM tCustomers
</cfquery>

<cfdump var="#qCustomers#" />
