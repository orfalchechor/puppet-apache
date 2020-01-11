Facter.add(:apache_processes) do
  confine :kernel => "Linux" # draait alleen op Linux
  setcode do
    osfamily = Facter.value(:osfamily) # lookup osfamily
    case osfamily
    when 'Debian'
      Facter::Core::Execution.execute('pgrep apache2 | wc -l')
    when 'RedHat'
      Facter::Core::Execution.execute('pgrep httpd | wc -l ')
    end
  end
end
