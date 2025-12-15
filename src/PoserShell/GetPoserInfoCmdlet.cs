using System.Management.Automation;

namespace PoserShell.Commands
{
    /// <summary>
    /// <para type="synopsis">Gets information about the PoserShell module.</para>
    /// <para type="description">The Get-PoserInfo cmdlet returns version and environment information about the PoserShell module.</para>
    /// <example>
    ///   <code>Get-PoserInfo</code>
    ///   <para>Gets basic module information.</para>
    /// </example>
    /// <example>
    ///   <code>Get-PoserInfo -Detailed</code>
    ///   <para>Gets detailed module and runtime information.</para>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "PoserInfo")]
    [OutputType(typeof(PSObject))]
    public class GetPoserInfoCmdlet : PSCmdlet
    {
        /// <summary>
        /// <para type="description">Returns detailed information including PowerShell version and runtime details.</para>
        /// </summary>
        [Parameter(Mandatory = false)]
        public SwitchParameter Detailed { get; set; }

        /// <summary>
        /// ProcessRecord method.
        /// </summary>
        protected override void ProcessRecord()
        {
            var info = new PSObject();
            info.Properties.Add(new PSNoteProperty("ModuleName", "PoserShell"));
            info.Properties.Add(new PSNoteProperty("ModuleVersion", "0.1.0"));
            info.Properties.Add(new PSNoteProperty("TargetFramework", "net8.0"));

            if (Detailed.IsPresent)
            {
                info.Properties.Add(new PSNoteProperty("PSVersion", PSVersionInfo.PSVersion.ToString()));
                info.Properties.Add(new PSNoteProperty("PSEdition", PSVersionInfo.PSEdition));
                info.Properties.Add(new PSNoteProperty("CLRVersion", System.Environment.Version.ToString()));
                info.Properties.Add(new PSNoteProperty("OSDescription", System.Runtime.InteropServices.RuntimeInformation.OSDescription));
            }

            WriteObject(info);
        }
    }
}
