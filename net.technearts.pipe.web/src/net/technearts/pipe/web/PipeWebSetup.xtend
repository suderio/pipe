/*
 * generated by Xtext 2.18.0
 */
package net.technearts.pipe.web

import com.google.inject.Guice
import com.google.inject.Injector
import net.technearts.pipe.PipeRuntimeModule
import net.technearts.pipe.PipeStandaloneSetup
import net.technearts.pipe.ide.PipeIdeModule
import org.eclipse.xtext.util.Modules2

/**
 * Initialization support for running Xtext languages in web applications.
 */
class PipeWebSetup extends PipeStandaloneSetup {
	
	override Injector createInjector() {
		return Guice.createInjector(Modules2.mixin(new PipeRuntimeModule, new PipeIdeModule, new PipeWebModule))
	}
	
}
