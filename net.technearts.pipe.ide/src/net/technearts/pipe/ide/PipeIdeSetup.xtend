/*
 * generated by Xtext 2.18.0
 */
package net.technearts.pipe.ide

import com.google.inject.Guice
import net.technearts.pipe.PipeRuntimeModule
import net.technearts.pipe.PipeStandaloneSetup
import org.eclipse.xtext.util.Modules2

/**
 * Initialization support for running Xtext languages as language servers.
 */
class PipeIdeSetup extends PipeStandaloneSetup {

	override createInjector() {
		Guice.createInjector(Modules2.mixin(new PipeRuntimeModule, new PipeIdeModule))
	}
	
}
