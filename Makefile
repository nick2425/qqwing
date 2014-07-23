.PHONY: all
all: dist

.PHONY: dist
dist: jar tgz rpm
	@build/show_dist.sh

.PHONY: compile
compile: javacompile cppcompile

.PHONY: javaversion
javaversion: notroot
	@build/java_version.sh

.PHONY: javacompile
javacompile: javaversion
	@build/java_compile.sh

.PHONY: jar
jar: javacompile
	@build/jar_build.sh

.PHONY: cppconfigure
cppconfigure: notroot
	@build/cpp_configure.sh

.PHONY: cppcompile
cppcompile: cppconfigure
	@build/cpp_compile.sh

.PHONY: tgz
tgz: cppcompile
	@build/cpp_dist.sh

.PHONY: rpm
rpm: tgz
	@build/rpm_build.sh

.PHONY: install
install: cppcompile
	@build/cpp_install.sh

.PHONY: notroot
notroot:
	@build/not_root_check.sh

.PHONY: clean
clean:
	rm -rf target/