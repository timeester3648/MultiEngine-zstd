void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	project.name("zstd");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	project.license("./LICENSE");

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"./lib"
	});

	properties.files({
		"./lib/**.h",
		"./lib/**.c",
		"./lib/**.cpp"
	});

	properties.defines({
		"ZSTD_MULTITHREAD=1",
		"ZSTD_LEGACY_SUPPORT=5"
	});

	{
		MultiBuild::ScopedFilter _(workspace, "project.compiler:VisualCpp");
		properties.disable_warnings("4244");
	}

	{
		MultiBuild::ScopedFilter _(workspace, "config.platform:Windows");
		properties.defines("_CRT_SECURE_NO_WARNINGS" );
	}
}