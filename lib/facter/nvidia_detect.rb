Facter.add(:nvidiagfx) do
	confine :kernel => "Linux"
	setcode do
		Facter::Core::Execution.execute('lspci -d 10de: | grep VGA').present?
	end
end
