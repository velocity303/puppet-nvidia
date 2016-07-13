Facter.add(:nvidiagfx) do
	confine :kernel => "Linux"
	setcode do
		Facter::Core::Execution.execute('lspci -d 10de: | grep NVIDIA').to_s != ''
	end
end
