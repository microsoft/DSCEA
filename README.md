# DSC Environment Analyzer

DSC Environment Analyzer (DSCEA) is a simple implementation of PowerShell Desired State Configuration that uses the declarative nature of DSC to scan Windows OS based systems in an environment against a defined reference MOF file and generate compliance reports as to whether systems match the desired configuration.

This solution is provided as a PowerShell module, and it includes a customizable reporting engine that can provide reports on overall compliance and details on any DSC resource found to be not in compliance in an environment. Compliance scanning has been implemented utilizing multi-threading practices, and has capabilities for scale and throttling for large environments.

Documentation for DSCEA can be found at [https://microsoft.github.io/DSCEA](https://microsoft.github.io/DSCEA)

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
