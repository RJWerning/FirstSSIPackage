# Pluralsight - Building Your First SSIS Package by Thomas LeBlanc
- https://app.pluralsight.com/library/courses/building-first-ssis-package/

## Chapter 1: Course overview
- Using SQL Server data tools
- Difference between a control and data flows
- Transformation components
- Sharing connections and parameters
- Preferred deployment techniques


## Chapter 2: Planning Data integration using SSIS
### Tools and files installed
	SQL Server 2016 Developers Edition or higher
		Install SSIS

	SQL Server Data Tools (SSDT) - contains Visual Studio shell
		Visual Studio 2017 or higher

	Adventure Works OLTP database

	Installed SQL Server 2019 Developer
		Used Windows Authentication - COREBTS\Rich.Werning
		

	Add extensions to Visual Studio:
		Installed SQL Server Integration Services with Visual Studio 2019
		https://www.mssqltips.com/sqlservertip/6481/install-sql-server-integration-services-in-visual-studio-2019/
			From Microsoft - free
			
		SQL Server Integration Services Projects
		Microsoft Reporting Services Projects
		Microsoft Analysis Services Projects
		

	Install SSDT with Visual Studio 2019
		https://docs.microsoft.com/en-us/sql/ssdt/download-sql-server-data-tools-ssdt?view=sql-server-ver15#ssdt-for-visual-studio-2019
		Installed via the Visual Studio Installer > Modify Install > Data Storage and Processing


	Installed SQL Server Management Studio
		https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?redirectedfrom=MSDN&view=sql-server-ver15
		

	In SQL Server Management Studio, restore the Adventure Works database from the demo source
		From: C:\Development\FirstSSISPackage\Demo source
		To: C:\Database\SqlServer
	
### Creating a Project and Package
	Development environment for Microsoft business intelligence tools Integration Service (SSIS), Analysis Services (SSAS) and Reporting Services (SSRS). This does not include power BI.
	
	Solution:
		To start an integration service during development, you're going to create a solution. It is a container for projects like SSIS, SSAS and SSRS plus external files.
	
	Project:
		Project is a container for packages and supporting objects like connections and parameters within a project that can be shared through packages.
		
	Creating a project and Package:
		In order to create a project in the SQL Server Data Tools, go to File menu choice and choose New. You get a prompt that lets you select from the different templates that are installed based on the Microsoft business intelligence tools.
		
		When you create a project, it automatically creates a solution. By default it names it package.dtsx, typically you rename the project.

### Demo: Creating a project and a package:
	Visual Studio - File > New > Project - Integration Services Project
		Project Name: BuildingOurFirstSSISPackage
		Location: C:\Development\FirstSSISPackage\
		Solution Name: BuildingOurFirstSSISPackage
	
	VS > Solution Explorer > SSIS Packages:
		Rename Package.dtsx to FirstSSISPackage.dtsx
		
		Opening the package (FirstSSISPackage) causes the SSIS Toolbox to display in the designer
		Depending on where you're at in the package affects what is shown in the toolbox, by default it's Control Flow
		
		If you drag the Data Flow Task to Control Flow on the designer, it drops a Data Flow Task component.
			Double click on this component, it changes the designer tab to "Data Flow"
			It also changes the SSIS Toolbox components that are available for that part of the package.

## Demo: Developing the Flow of data
	ETL - Extract, Transform, and Load
	
	Rename the "Data Flow Task" to "Importing the products"
	Change to 'Data Flow' tab
		In the left toolbox > Other Sources > Flat File Source - drag & drop on canvas
		Rename to 'Product csv'
		Double click, create the connection and select the product.csv files
		
		In the left toolbox > Other Destinations > OLD DB Destination - drag & drop on canvas
		Rename to 'Products table'
		
		Drag Source Blue Arrow (Flow through, red is Error) to Destination
		Destination has a red X on it, means that it's not configured correctly
		
		Double click destination, select Connection Manager > New
			Server Name: .  (means LocalHost)
			Select or enter a database name: AdvWrk17
		
		Destination Editor:
			OLE DB connection mananger: LocalHost.AdvWrk17
			Data access mode: Table or view
			Name of the table: 
				If the table doesn't already exist, click New
				This will give you a script that you can run in SQL Server Mgmnt Studio, create table then..
				Set the table name
			Verify the mappings
			
		Right click on the canvas > Execute Task - 77 rows inserted

## Chapter 3: Managing SSIS Projects

### Introduction
	Managing SSIS Projects
	Sharing connections between packages
	Using project parameters in expressions
	Creating the catalog
	Deploying to catalog
	
### Managing SSIS Projects
	Projects: Can share information with packages
		Projects are a way to organize packages that you're writing in Integration Services
	Connections: Connects not created in package
	Parameters: Use variables in package only when necessary
	
	Solution - Top Level
	Solution has Projects
	Projects have Packages
	
	The reason we create this project and solution is that it can enable source control so developers can check in and out the code and share betwen developers.
	
	The package is really inside a container which is in the project, and this is where the power comes with the connections and parameters.
	We can use the parameters in expressions for different objects in our SSIS package.

### Demo: Single packages with variables and connections
	Connections within 1 package are not available in other packages
	Variables within 1 package are not available in other packages
	Consider the scoping of variables, sometimes it makes sense to have their own variables
	Can also have a parent package where the variables exist and pass them to child packages

### Sharing Connections between packages
	Connection Manager: Shared area for connections that all source and destination components depend on. Packages in a project can use the same connections.
	You can move connections from a package to the project
		Use good naming conventions when doing this
		Right click on Package level Connection Mananger > Convert to Project Connection
		
	You can use the connection manager when you deploy to switch between Dev, QA, Prod etc.
	
### Demo: Sharing connections between projects
	Converted Products & AdvWrk17 to Project connections
	
	To share variables, create Project.params
		SourceDB: String > AdvWrk17
		SourceServer: String > . (local host, but could Dev, Qa etc)
		