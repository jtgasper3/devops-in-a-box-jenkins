import jenkins.model.*
import hudson.model.*
import hudson.tools.*
import org.jenkinsci.plugins.openjdk_native.*

def inst = Jenkins.getInstance()

def desc = inst.getDescriptor("hudson.model.JDK")

def installations = [];

  def installer = new OpenJDKInstaller(OpenJDKInstaller.OpenJDKPackage.openJDK8)
  def installerProps = new InstallSourceProperty([installer])
  def installation = new JDK("ojdk8", "", [installerProps])
  installations.push(installation)

desc.setInstallations(installations.toArray(new JDK[0]))

desc.save()  

Jenkins.instance.save()
