/*
 * generated by Xtext 2.18.0
 */
package net.technearts.pipe.formatting2

import com.google.inject.Inject
import net.technearts.pipe.pipe.EvalExpression
import net.technearts.pipe.pipe.Model
import net.technearts.pipe.services.PipeGrammarAccess
import org.eclipse.xtext.formatting2.AbstractFormatter2
import org.eclipse.xtext.formatting2.IFormattableDocument

class PipeFormatter extends AbstractFormatter2 {
	
	@Inject extension PipeGrammarAccess

	def dispatch void format(Model model, extension IFormattableDocument document) {
		// TODO: format HiddenRegions around keywords, attributes, cross references, etc. 
		for (abstractElement : model.elements) {
			abstractElement.format
		}
	}

	def dispatch void format(EvalExpression evalExpression, extension IFormattableDocument document) {
		// TODO: format HiddenRegions around keywords, attributes, cross references, etc. 
		evalExpression.expression.format
	}
	
	// TODO: implement for Variable, Pipe, Or, And, Equality, Comparison, MulOrDiv, Not, Array, Map, Plus, Minus
}
