# cms-ars-3.1-moderate-oracle-mysql-ee-5.7-cis-overlay
(Draft v2.0.0 Work-In-Progress) InSpec profile overlay to validate the secure configuration of Oracle MySQL EE 5.7 against [CIS's](https://www.cisecurity.org/cis-benchmarks/) Oracle MySQL EE 5.7 Benchmark 2.0.0 tailored for [CMS ARS 3.1](https://www.cms.gov/Research-Statistics-Data-and-Systems/CMS-Information-Technology/InformationSecurity/Info-Security-Library-Items/ARS-31-Publication.html) for CMS systems categorized as Moderate.

#### Container-Ready: Profile updated to adapt checks when the running against a containerized instance of MySQL, based on reference container: (docker pull registry1.dso.mil/ironbank/opensource/mysql/mysql-5.7:5.7.35)

## Getting Started  

__For the best security of the runner, always install on the runner the _latest version_ of InSpec and supporting Ruby language components.__ 

Latest versions and installation options are available at the [InSpec](http://inspec.io/) site.

## Tailoring to Your Environment
The following inputs must be configured in an inputs ".yml" file for the profile to run correctly for your specific environment. More information about InSpec inputs can be found in the [InSpec Profile Documentation](https://www.inspec.io/docs/reference/profiles/).
 
```
# Description: Username MySQL DB Server (e.g., 'root')
user: ''

# Description: Password MySQL DB Server (e.g., 'P@ssw0rd1')
password: ''

# Description: Hostname MySQL DB Server (e.g., 'localhost')
host: ''

# Description: Port MySQL DB Server
port: 3306

# Description: List of MySQL database users (e.g., ['root'])
mysql_users: []   

# Description: Set to true if the MySQL server has a slave configured
is_mysql_server_slave_configured: false

# Description: List of MySQL administrative users (e.g., ['root'])
mysql_administrative_users: [] 

# Description: List of MySQL users allows to modify or create data structures (e.g., ['root'])
mysql_users_allowed_modify_or_create: [] 
```

## Running This Overlay Directly from Github

Against a _**locally-hosted**_ instance (i.e., InSpec installed on the target)
```
inspec exec https://github.com/CMSgov/cms-ars-3.1-moderate-oracle-mysql-ee-5.7-cis-overlay/archive/master.tar.gz --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter json:<path_to_your_output_file/name_of_your_output_file.json>
```
Against a _**docker-containerized**_ instance (i.e., InSpec installed on the node hosting the container):
```bash
inspec exec https://github.com/CMSgov/cms-ars-3.1-moderate-oracle-mysql-ee-5.7-cis-overlay/archive/master.tar.gz -t docker://instance_id --input-file <path_to_your_input_file/name_of_your_input_file.yml> --reporter json:<path_to_your_output_file/name_of_your_output_file.json> 
```
### Different Run Options

  [Full exec options](https://docs.chef.io/inspec/cli/#options-3)

## Running This Overlay from a local Archive copy 

If your runner is not always expected to have direct access to GitHub, use the following steps to create an archive bundle of this overlay and all of its dependent tests:

(Git is required to clone the InSpec profile using the instructions below. Git can be downloaded from the [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) site.)

When the __"runner"__ host uses this profile overlay for the first time, follow these steps: 

```
mkdir profiles
cd profiles
git clone https://github.com/CMSgov/cms-ars-3.1-moderate-oracle-mysql-ee-5.7-cis-overlay.git
inspec arhive cms-ars-3.1-moderate-oracle-mysql-ee-5.7-cis-overlay
inspec exec <name of generated archive> --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter json:<path_to_your_output_file/name_of_your_output_file.json>
```

For every successive run, follow these steps to always have the latest version of this overlay and dependent profiles:

```
cd cms-ars-3.1-moderate-oracle-mysql-ee-5.7-cis-overlay
git pull
cd ..
inspec arhive cms-ars-3.1-moderate-oracle-mysql-ee-5.7-cis-overlay --overwrite
inspec exec <name of generated archive> --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter json:<path_to_your_output_file/name_of_your_output_file.json>
```

## Using Heimdall for Viewing the JSON Results

The JSON results output file can be loaded into __[heimdall-lite](https://heimdall-lite.mitre.org/)__ for a user-interactive, graphical view of the InSpec results. 

The JSON InSpec results file may also be loaded into a __[full heimdall server](https://github.com/mitre/heimdall)__, allowing for additional functionality such as to store and compare multiple profile runs.

## Authors
* Eugene Aronne - [ejaronne](https://github.com/ejaronne)
* Danny Haynes - [djhaynes](https://github.com/djhaynes)

## Special Thanks
* Alicia Sturtevant - [asturtevant](https://github.com/asturtevant)
* Shivani Karikar - [karikarshivani](https://github.com/karikarshivani)

## Contributing and Getting Help
To report a bug or feature request, please open an [issue](https://github.com/CMSgov/cms-ars-3.1-moderate-oracle-mysql-ee-5.7-cis-overlay/issues/new).

### NOTICE

© 2018-2020 The MITRE Corporation.

Approved for Public Release; Distribution Unlimited. Case Number 18-3678.

### NOTICE 

MITRE hereby grants express written permission to use, reproduce, distribute, modify, and otherwise leverage this software to the extent permitted by the licensed terms provided in the LICENSE.md file included with this project.

### NOTICE  

This software was produced for the U. S. Government under Contract Number HHSM-500-2012-00008I, and is subject to Federal Acquisition Regulation Clause 52.227-14, Rights in Data-General.  

No other use other than that granted to the U. S. Government, or to those acting on behalf of the U. S. Government under that Clause is authorized without the express written permission of The MITRE Corporation.

For further information, please contact The MITRE Corporation, Contracts Management Office, 7515 Colshire Drive, McLean, VA  22102-7539, (703) 983-6000.

### NOTICE 

CIS Benchmarks are published by the Center for Internet Security (CIS), see: https://www.cisecurity.org/.
