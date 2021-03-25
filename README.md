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
