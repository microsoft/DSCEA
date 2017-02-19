$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\..\functions\$sut"

Describe $sut {
    Set-Content 'TestDrive:\results.xml' -value @'
<Objs Version="1.1.0.1" xmlns="http://schemas.microsoft.com/powershell/2004/04">
  <Obj RefId="0">
    <TN RefId="0">
      <T>Microsoft.Management.Infrastructure.CimMethodResult#MSFT_DSCLocalConfigurationManager#TestConfiguration</T>
      <T>Microsoft.Management.Infrastructure.CimMethodResult</T>
      <T>System.Management.Automation.PSCustomObject</T>
      <T>System.Object</T>
    </TN>
    <MS>
      <B N="InDesiredState">false</B>
      <Obj N="ResourcesInDesiredState" RefId="1">
        <TN RefId="1">
          <T>Microsoft.Management.Infrastructure.CimInstance[]</T>
          <T>System.Array</T>
          <T>System.Object</T>
        </TN>
        <LST>
          <Obj RefId="2">
            <TN RefId="2">
              <T>Microsoft.Management.Infrastructure.CimInstance#root/Microsoft/Windows/DesiredStateConfiguration/MSFT_ResourceInDesiredState</T>
              <T>Microsoft.Management.Infrastructure.CimInstance#root/Microsoft/Windows/DesiredStateConfiguration/MSFT_DSCResource</T>
              <T>Microsoft.Management.Infrastructure.CimInstance#root/Microsoft/Windows/DesiredStateConfiguration/OMI_BaseResource</T>
              <T>Microsoft.Management.Infrastructure.CimInstance#MSFT_ResourceInDesiredState</T>
              <T>Microsoft.Management.Infrastructure.CimInstance#MSFT_DSCResource</T>
              <T>Microsoft.Management.Infrastructure.CimInstance#OMI_BaseResource</T>
              <T>Microsoft.Management.Infrastructure.CimInstance</T>
              <T>System.Object</T>
            </TN>
            <ToString>[Registry]ConsentPromptBehaviorAdmin</ToString>
            <Props>
              <S N="ConfigurationName">MemberServerSecuritySettings</S>
              <Nil N="DependsOn" />
              <S N="ModuleName">PSDesiredStateConfiguration</S>
              <S N="ModuleVersion">1.1</S>
              <Nil N="PsDscRunAsCredential" />
              <S N="ResourceId">[Registry]ConsentPromptBehaviorAdmin</S>
              <S N="SourceInfo">C:\Program Files\dsc-ea\SampleConfig.ps1::17::9::Registry</S>
              <Db N="DurationInSeconds">0.359</Db>
              <Nil N="Error" />
              <Nil N="FinalState" />
              <B N="InDesiredState">true</B>
              <Nil N="InitialState" />
              <S N="InstanceName">ConsentPromptBehaviorAdmin</S>
              <B N="RebootRequested">false</B>
              <S N="ResourceName">Registry</S>
              <DT N="StartDate">2017-02-05T05:43:05.507+00:00</DT>
              <S N="PSComputerName">dsclabmember2</S>
            </Props>
            <MS>
              <Obj N="__ClassMetadata" RefId="3">
                <TN RefId="3">
                  <T>System.Collections.ArrayList</T>
                  <T>System.Object</T>
                </TN>
                <LST>
                  <Obj RefId="4">
                    <MS>
                      <S N="ClassName">OMI_BaseResource</S>
                      <S N="Namespace">root/Microsoft/Windows/DesiredStateConfiguration</S>
                      <S N="ServerName">dsclabmember2</S>
                      <I32 N="Hash">1096445496</I32>
                      <S N="MiXml">&lt;CLASS NAME="OMI_BaseResource"&gt;&lt;QUALIFIER NAME="ClassVersion" TYPE="string" TOSUBCLASS="false"&gt;&lt;VALUE&gt;1.0.0&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;QUALIFIER NAME="locale" TYPE="sint32" TOSUBCLASS="false"&gt;&lt;VALUE&gt;1033&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;PROPERTY NAME="ConfigurationName" TYPE="string"&gt;&lt;QUALIFIER NAME="write" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY.ARRAY NAME="DependsOn" TYPE="string"&gt;&lt;QUALIFIER NAME="write" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;VALUE.ARRAY&gt;&lt;/VALUE.ARRAY&gt;&lt;/PROPERTY.ARRAY&gt;&lt;PROPERTY NAME="ModuleName" TYPE="string"&gt;&lt;QUALIFIER NAME="Required" TYPE="boolean" OVERRIDABLE="false"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="ModuleVersion" TYPE="string"&gt;&lt;QUALIFIER NAME="Required" TYPE="boolean" OVERRIDABLE="false"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="PsDscRunAsCredential" TYPE="string"&gt;&lt;QUALIFIER NAME="EmbeddedInstance" TYPE="string"&gt;&lt;VALUE&gt;MSFT_Credential&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="ResourceId" TYPE="string"&gt;&lt;QUALIFIER NAME="Required" TYPE="boolean" OVERRIDABLE="false"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="SourceInfo" TYPE="string"&gt;&lt;QUALIFIER NAME="write" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;/CLASS&gt;</S>
                    </MS>
                  </Obj>
                  <Obj RefId="5">
                    <MS>
                      <S N="ClassName">MSFT_DSCResource</S>
                      <S N="Namespace">root/Microsoft/Windows/DesiredStateConfiguration</S>
                      <S N="ServerName">dsclabmember2</S>
                      <I32 N="Hash">1096441336</I32>
                      <S N="MiXml">&lt;CLASS NAME="MSFT_DSCResource" SUPERCLASS="OMI_BaseResource"&gt;&lt;QUALIFIER NAME="ClassVersion" TYPE="string" TOSUBCLASS="false"&gt;&lt;VALUE&gt;1.0.0&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;QUALIFIER NAME="locale" TYPE="sint32" TOSUBCLASS="false"&gt;&lt;VALUE&gt;1033&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;PROPERTY NAME="DurationInSeconds" TYPE="real64"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="Error" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="FinalState" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="InDesiredState" TYPE="boolean"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="InitialState" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="InstanceName" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="RebootRequested" TYPE="boolean"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="ResourceName" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="StartDate" TYPE="datetime"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;/CLASS&gt;</S>
                    </MS>
                  </Obj>
                  <Obj RefId="6">
                    <MS>
                      <S N="ClassName">MSFT_ResourceInDesiredState</S>
                      <S N="Namespace">root/Microsoft/Windows/DesiredStateConfiguration</S>
                      <S N="ServerName">dsclabmember2</S>
                      <I32 N="Hash">1096973704</I32>
                      <S N="MiXml">&lt;CLASS NAME="MSFT_ResourceInDesiredState" SUPERCLASS="MSFT_DSCResource"&gt;&lt;QUALIFIER NAME="ClassVersion" TYPE="string" TOSUBCLASS="false"&gt;&lt;VALUE&gt;1.0.0&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;QUALIFIER NAME="locale" TYPE="sint32" TOSUBCLASS="false"&gt;&lt;VALUE&gt;1033&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;PROPERTY NAME="ConfigurationName" TYPE="string"&gt;&lt;QUALIFIER NAME="write" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY.ARRAY NAME="DependsOn" TYPE="string"&gt;&lt;QUALIFIER NAME="write" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;VALUE.ARRAY&gt;&lt;/VALUE.ARRAY&gt;&lt;/PROPERTY.ARRAY&gt;&lt;PROPERTY NAME="ModuleName" TYPE="string"&gt;&lt;QUALIFIER NAME="Required" TYPE="boolean" OVERRIDABLE="false"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="ModuleVersion" TYPE="string"&gt;&lt;QUALIFIER NAME="Required" TYPE="boolean" OVERRIDABLE="false"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="PsDscRunAsCredential" TYPE="string"&gt;&lt;QUALIFIER NAME="EmbeddedInstance" TYPE="string"&gt;&lt;VALUE&gt;MSFT_Credential&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="ResourceId" TYPE="string"&gt;&lt;QUALIFIER NAME="Required" TYPE="boolean" OVERRIDABLE="false"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="SourceInfo" TYPE="string"&gt;&lt;QUALIFIER NAME="write" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="DurationInSeconds" TYPE="real64"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="Error" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="FinalState" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="InDesiredState" TYPE="boolean"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="InitialState" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="InstanceName" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="RebootRequested" TYPE="boolean"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="ResourceName" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="StartDate" TYPE="datetime"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;/CLASS&gt;</S>
                    </MS>
                  </Obj>
                </LST>
              </Obj>
            </MS>
          </Obj>
          <Obj RefId="7">
            <TNRef RefId="2" />
            <ToString>[Registry]PromptOnSecureDesktop</ToString>
            <Props>
              <S N="ConfigurationName">MemberServerSecuritySettings</S>
              <Nil N="DependsOn" />
              <S N="ModuleName">PSDesiredStateConfiguration</S>
              <S N="ModuleVersion">1.1</S>
              <Nil N="PsDscRunAsCredential" />
              <S N="ResourceId">[Registry]PromptOnSecureDesktop</S>
              <S N="SourceInfo">C:\Program Files\dsc-ea\SampleConfig.ps1::25::9::Registry</S>
              <Db N="DurationInSeconds">0.422</Db>
              <Nil N="Error" />
              <Nil N="FinalState" />
              <B N="InDesiredState">true</B>
              <Nil N="InitialState" />
              <S N="InstanceName">PromptOnSecureDesktop</S>
              <B N="RebootRequested">false</B>
              <S N="ResourceName">Registry</S>
              <DT N="StartDate">2017-02-05T05:43:05.507+00:00</DT>
              <S N="PSComputerName">dsclabmember2</S>
            </Props>
            <MS>
              <Obj N="__ClassMetadata" RefId="8">
                <TNRef RefId="3" />
                <LST>
                  <Obj RefId="9">
                    <MS>
                      <S N="ClassName">MSFT_ResourceInDesiredState</S>
                      <S N="Namespace">root/Microsoft/Windows/DesiredStateConfiguration</S>
                      <S N="ServerName">dsclabmember2</S>
                      <I32 N="Hash">1096973704</I32>
                    </MS>
                  </Obj>
                </LST>
              </Obj>
            </MS>
          </Obj>
          <Obj RefId="10">
            <TNRef RefId="2" />
            <ToString>[WindowsFeature]ActiveDirectoryDomainServices</ToString>
            <Props>
              <S N="ConfigurationName">MemberServerSecuritySettings</S>
              <Nil N="DependsOn" />
              <S N="ModuleName">PSDesiredStateConfiguration</S>
              <S N="ModuleVersion">1.1</S>
              <Nil N="PsDscRunAsCredential" />
              <S N="ResourceId">[WindowsFeature]ActiveDirectoryDomainServices</S>
              <S N="SourceInfo">C:\Program Files\dsc-ea\SampleConfig.ps1::43::9::WindowsFeature</S>
              <Db N="DurationInSeconds">0.968</Db>
              <Nil N="Error" />
              <Nil N="FinalState" />
              <B N="InDesiredState">true</B>
              <Nil N="InitialState" />
              <S N="InstanceName">ActiveDirectoryDomainServices</S>
              <B N="RebootRequested">false</B>
              <S N="ResourceName">WindowsFeature</S>
              <DT N="StartDate">2017-02-05T05:43:05.507+00:00</DT>
              <S N="PSComputerName">dsclabmember2</S>
            </Props>
            <MS>
              <Obj N="__ClassMetadata" RefId="11">
                <TNRef RefId="3" />
                <LST>
                  <Obj RefId="12">
                    <MS>
                      <S N="ClassName">MSFT_ResourceInDesiredState</S>
                      <S N="Namespace">root/Microsoft/Windows/DesiredStateConfiguration</S>
                      <S N="ServerName">dsclabmember2</S>
                      <I32 N="Hash">1096973704</I32>
                    </MS>
                  </Obj>
                </LST>
              </Obj>
            </MS>
          </Obj>
          <Obj RefId="13">
            <TNRef RefId="2" />
            <ToString>[WindowsFeature]DNSServer</ToString>
            <Props>
              <S N="ConfigurationName">MemberServerSecuritySettings</S>
              <Nil N="DependsOn" />
              <S N="ModuleName">PSDesiredStateConfiguration</S>
              <S N="ModuleVersion">1.1</S>
              <Nil N="PsDscRunAsCredential" />
              <S N="ResourceId">[WindowsFeature]DNSServer</S>
              <S N="SourceInfo">C:\Program Files\dsc-ea\SampleConfig.ps1::48::3::WindowsFeature</S>
              <Db N="DurationInSeconds">1.281</Db>
              <Nil N="Error" />
              <Nil N="FinalState" />
              <B N="InDesiredState">true</B>
              <Nil N="InitialState" />
              <S N="InstanceName">DNSServer</S>
              <B N="RebootRequested">false</B>
              <S N="ResourceName">WindowsFeature</S>
              <DT N="StartDate">2017-02-05T05:43:05.507+00:00</DT>
              <S N="PSComputerName">dsclabmember2</S>
            </Props>
            <MS>
              <Obj N="__ClassMetadata" RefId="14">
                <TNRef RefId="3" />
                <LST>
                  <Obj RefId="15">
                    <MS>
                      <S N="ClassName">MSFT_ResourceInDesiredState</S>
                      <S N="Namespace">root/Microsoft/Windows/DesiredStateConfiguration</S>
                      <S N="ServerName">dsclabmember2</S>
                      <I32 N="Hash">1096973704</I32>
                    </MS>
                  </Obj>
                </LST>
              </Obj>
            </MS>
          </Obj>
          <Obj RefId="16">
            <TNRef RefId="2" />
            <ToString>[WindowsFeature]DHCPServer</ToString>
            <Props>
              <S N="ConfigurationName">MemberServerSecuritySettings</S>
              <Nil N="DependsOn" />
              <S N="ModuleName">PSDesiredStateConfiguration</S>
              <S N="ModuleVersion">1.1</S>
              <Nil N="PsDscRunAsCredential" />
              <S N="ResourceId">[WindowsFeature]DHCPServer</S>
              <S N="SourceInfo">C:\Program Files\dsc-ea\SampleConfig.ps1::53::6::WindowsFeature</S>
              <Db N="DurationInSeconds">1.546</Db>
              <Nil N="Error" />
              <Nil N="FinalState" />
              <B N="InDesiredState">true</B>
              <Nil N="InitialState" />
              <S N="InstanceName">DHCPServer</S>
              <B N="RebootRequested">false</B>
              <S N="ResourceName">WindowsFeature</S>
              <DT N="StartDate">2017-02-05T05:43:05.507+00:00</DT>
              <S N="PSComputerName">dsclabmember2</S>
            </Props>
            <MS>
              <Obj N="__ClassMetadata" RefId="17">
                <TNRef RefId="3" />
                <LST>
                  <Obj RefId="18">
                    <MS>
                      <S N="ClassName">MSFT_ResourceInDesiredState</S>
                      <S N="Namespace">root/Microsoft/Windows/DesiredStateConfiguration</S>
                      <S N="ServerName">dsclabmember2</S>
                      <I32 N="Hash">1096973704</I32>
                    </MS>
                  </Obj>
                </LST>
              </Obj>
            </MS>
          </Obj>
          <Obj RefId="19">
            <TNRef RefId="2" />
            <ToString>[WindowsFeature]WindowsRoleFax</ToString>
            <Props>
              <S N="ConfigurationName">MemberServerSecuritySettings</S>
              <Nil N="DependsOn" />
              <S N="ModuleName">PSDesiredStateConfiguration</S>
              <S N="ModuleVersion">1.1</S>
              <Nil N="PsDscRunAsCredential" />
              <S N="ResourceId">[WindowsFeature]WindowsRoleFax</S>
              <S N="SourceInfo">C:\Program Files\dsc-ea\SampleConfig.ps1::58::3::WindowsFeature</S>
              <Db N="DurationInSeconds">1.812</Db>
              <Nil N="Error" />
              <Nil N="FinalState" />
              <B N="InDesiredState">true</B>
              <Nil N="InitialState" />
              <S N="InstanceName">WindowsRoleFax</S>
              <B N="RebootRequested">false</B>
              <S N="ResourceName">WindowsFeature</S>
              <DT N="StartDate">2017-02-05T05:43:05.507+00:00</DT>
              <S N="PSComputerName">dsclabmember2</S>
            </Props>
            <MS>
              <Obj N="__ClassMetadata" RefId="20">
                <TNRef RefId="3" />
                <LST>
                  <Obj RefId="21">
                    <MS>
                      <S N="ClassName">MSFT_ResourceInDesiredState</S>
                      <S N="Namespace">root/Microsoft/Windows/DesiredStateConfiguration</S>
                      <S N="ServerName">dsclabmember2</S>
                      <I32 N="Hash">1096973704</I32>
                    </MS>
                  </Obj>
                </LST>
              </Obj>
            </MS>
          </Obj>
        </LST>
      </Obj>
      <Obj N="ResourcesNotInDesiredState" RefId="22">
        <TNRef RefId="1" />
        <LST>
          <Obj RefId="23">
            <TN RefId="4">
              <T>Microsoft.Management.Infrastructure.CimInstance#root/Microsoft/Windows/DesiredStateConfiguration/MSFT_ResourceNotInDesiredState</T>
              <T>Microsoft.Management.Infrastructure.CimInstance#root/Microsoft/Windows/DesiredStateConfiguration/MSFT_DSCResource</T>
              <T>Microsoft.Management.Infrastructure.CimInstance#root/Microsoft/Windows/DesiredStateConfiguration/OMI_BaseResource</T>
              <T>Microsoft.Management.Infrastructure.CimInstance#MSFT_ResourceNotInDesiredState</T>
              <T>Microsoft.Management.Infrastructure.CimInstance#MSFT_DSCResource</T>
              <T>Microsoft.Management.Infrastructure.CimInstance#OMI_BaseResource</T>
              <T>Microsoft.Management.Infrastructure.CimInstance</T>
              <T>System.Object</T>
            </TN>
            <ToString>[Service]MicrosoftAntimalwareService</ToString>
            <Props>
              <S N="ConfigurationName">MemberServerSecuritySettings</S>
              <Nil N="DependsOn" />
              <S N="ModuleName">PSDesiredStateConfiguration</S>
              <S N="ModuleVersion">1.1</S>
              <Nil N="PsDscRunAsCredential" />
              <S N="ResourceId">[Service]MicrosoftAntimalwareService</S>
              <S N="SourceInfo">C:\Program Files\dsc-ea\SampleConfig.ps1::10::9::Service</S>
              <Db N="DurationInSeconds">0.093</Db>
              <Nil N="Error" />
              <Nil N="FinalState" />
              <B N="InDesiredState">false</B>
              <Nil N="InitialState" />
              <S N="InstanceName">MicrosoftAntimalwareService</S>
              <B N="RebootRequested">false</B>
              <S N="ResourceName">Service</S>
              <DT N="StartDate">2017-02-05T05:43:05.507+00:00</DT>
              <S N="PSComputerName">dsclabmember2</S>
            </Props>
            <MS>
              <Obj N="__ClassMetadata" RefId="24">
                <TNRef RefId="3" />
                <LST>
                  <Obj RefId="25">
                    <MS>
                      <S N="ClassName">OMI_BaseResource</S>
                      <S N="Namespace">root/Microsoft/Windows/DesiredStateConfiguration</S>
                      <S N="ServerName">dsclabmember2</S>
                      <I32 N="Hash">866517384</I32>
                      <S N="MiXml">&lt;CLASS NAME="OMI_BaseResource"&gt;&lt;QUALIFIER NAME="ClassVersion" TYPE="string" TOSUBCLASS="false"&gt;&lt;VALUE&gt;1.0.0&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;QUALIFIER NAME="locale" TYPE="sint32" TOSUBCLASS="false"&gt;&lt;VALUE&gt;1033&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;PROPERTY NAME="ConfigurationName" TYPE="string"&gt;&lt;QUALIFIER NAME="write" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY.ARRAY NAME="DependsOn" TYPE="string"&gt;&lt;QUALIFIER NAME="write" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;VALUE.ARRAY&gt;&lt;/VALUE.ARRAY&gt;&lt;/PROPERTY.ARRAY&gt;&lt;PROPERTY NAME="ModuleName" TYPE="string"&gt;&lt;QUALIFIER NAME="Required" TYPE="boolean" OVERRIDABLE="false"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="ModuleVersion" TYPE="string"&gt;&lt;QUALIFIER NAME="Required" TYPE="boolean" OVERRIDABLE="false"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="PsDscRunAsCredential" TYPE="string"&gt;&lt;QUALIFIER NAME="EmbeddedInstance" TYPE="string"&gt;&lt;VALUE&gt;MSFT_Credential&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="ResourceId" TYPE="string"&gt;&lt;QUALIFIER NAME="Required" TYPE="boolean" OVERRIDABLE="false"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="SourceInfo" TYPE="string"&gt;&lt;QUALIFIER NAME="write" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;/CLASS&gt;</S>
                    </MS>
                  </Obj>
                  <Obj RefId="26">
                    <MS>
                      <S N="ClassName">MSFT_DSCResource</S>
                      <S N="Namespace">root/Microsoft/Windows/DesiredStateConfiguration</S>
                      <S N="ServerName">dsclabmember2</S>
                      <I32 N="Hash">866535064</I32>
                      <S N="MiXml">&lt;CLASS NAME="MSFT_DSCResource" SUPERCLASS="OMI_BaseResource"&gt;&lt;QUALIFIER NAME="ClassVersion" TYPE="string" TOSUBCLASS="false"&gt;&lt;VALUE&gt;1.0.0&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;QUALIFIER NAME="locale" TYPE="sint32" TOSUBCLASS="false"&gt;&lt;VALUE&gt;1033&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;PROPERTY NAME="DurationInSeconds" TYPE="real64"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="Error" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="FinalState" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="InDesiredState" TYPE="boolean"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="InitialState" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="InstanceName" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="RebootRequested" TYPE="boolean"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="ResourceName" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="StartDate" TYPE="datetime"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;/CLASS&gt;</S>
                    </MS>
                  </Obj>
                  <Obj RefId="27">
                    <MS>
                      <S N="ClassName">MSFT_ResourceNotInDesiredState</S>
                      <S N="Namespace">root/Microsoft/Windows/DesiredStateConfiguration</S>
                      <S N="ServerName">dsclabmember2</S>
                      <I32 N="Hash">866538184</I32>
                      <S N="MiXml">&lt;CLASS NAME="MSFT_ResourceNotInDesiredState" SUPERCLASS="MSFT_DSCResource"&gt;&lt;QUALIFIER NAME="ClassVersion" TYPE="string" TOSUBCLASS="false"&gt;&lt;VALUE&gt;1.0.0&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;QUALIFIER NAME="locale" TYPE="sint32" TOSUBCLASS="false"&gt;&lt;VALUE&gt;1033&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;PROPERTY NAME="ConfigurationName" TYPE="string"&gt;&lt;QUALIFIER NAME="write" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY.ARRAY NAME="DependsOn" TYPE="string"&gt;&lt;QUALIFIER NAME="write" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;VALUE.ARRAY&gt;&lt;/VALUE.ARRAY&gt;&lt;/PROPERTY.ARRAY&gt;&lt;PROPERTY NAME="ModuleName" TYPE="string"&gt;&lt;QUALIFIER NAME="Required" TYPE="boolean" OVERRIDABLE="false"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="ModuleVersion" TYPE="string"&gt;&lt;QUALIFIER NAME="Required" TYPE="boolean" OVERRIDABLE="false"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="PsDscRunAsCredential" TYPE="string"&gt;&lt;QUALIFIER NAME="EmbeddedInstance" TYPE="string"&gt;&lt;VALUE&gt;MSFT_Credential&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="ResourceId" TYPE="string"&gt;&lt;QUALIFIER NAME="Required" TYPE="boolean" OVERRIDABLE="false"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="SourceInfo" TYPE="string"&gt;&lt;QUALIFIER NAME="write" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="DurationInSeconds" TYPE="real64"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="Error" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="FinalState" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="InDesiredState" TYPE="boolean"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="InitialState" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="InstanceName" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="RebootRequested" TYPE="boolean"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="ResourceName" TYPE="string"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;PROPERTY NAME="StartDate" TYPE="datetime"&gt;&lt;QUALIFIER NAME="read" TYPE="boolean"&gt;&lt;VALUE&gt;true&lt;/VALUE&gt;&lt;/QUALIFIER&gt;&lt;/PROPERTY&gt;&lt;/CLASS&gt;</S>
                    </MS>
                  </Obj>
                </LST>
              </Obj>
            </MS>
          </Obj>
          <Obj RefId="28">
            <TNRef RefId="4" />
            <ToString>[Registry]Numberofpreviouslogonstocache</ToString>
            <Props>
              <S N="ConfigurationName">MemberServerSecuritySettings</S>
              <Nil N="DependsOn" />
              <S N="ModuleName">PSDesiredStateConfiguration</S>
              <S N="ModuleVersion">1.1</S>
              <Nil N="PsDscRunAsCredential" />
              <S N="ResourceId">[Registry]Numberofpreviouslogonstocache</S>
              <S N="SourceInfo">C:\Program Files\dsc-ea\SampleConfig.ps1::34::9::Registry</S>
              <Db N="DurationInSeconds">0.484</Db>
              <Nil N="Error" />
              <Nil N="FinalState" />
              <B N="InDesiredState">false</B>
              <Nil N="InitialState" />
              <S N="InstanceName">Numberofpreviouslogonstocache</S>
              <B N="RebootRequested">false</B>
              <S N="ResourceName">Registry</S>
              <DT N="StartDate">2017-02-05T05:43:05.507+00:00</DT>
              <S N="PSComputerName">dsclabmember2</S>
            </Props>
            <MS>
              <Obj N="__ClassMetadata" RefId="29">
                <TNRef RefId="3" />
                <LST>
                  <Obj RefId="30">
                    <MS>
                      <S N="ClassName">MSFT_ResourceNotInDesiredState</S>
                      <S N="Namespace">root/Microsoft/Windows/DesiredStateConfiguration</S>
                      <S N="ServerName">dsclabmember2</S>
                      <I32 N="Hash">866538184</I32>
                    </MS>
                  </Obj>
                </LST>
              </Obj>
            </MS>
          </Obj>
        </LST>
      </Obj>
      <U32 N="ReturnValue">0</U32>
      <S N="PSComputerName">dsclabmember2</S>
    </MS>
  </Obj>
</Objs>
'@
    Mock Export-CSV {[CmdletBinding()] param ([Parameter(ValueFromPipeline = $true)] $InputObject,$Path,[switch]$NoTypeInformation)}
    Mock Set-Location {}
    Mock Get-ChildItem {'lastresult.xml'}
    Mock Import-CliXml {Import-CliXml 'TestDrive:\results.xml'} -ParameterFilter {$Path -notlike '*TestDrive*'}
    Mock Invoke-Expression {}
    Mock Test-Path {$false} -ParameterFilter {$Path -like '.\DAY.CSV'}
    It 'Should import data' {
        Get-DscEaPowerBiReport | Assert-MockCalled Import-CliXML
    }
    It 'Should export data' {

    }
}