package interpreter

import net.technearts.pipe.pipe.BoolConstant
import net.technearts.pipe.pipe.Expression
import net.technearts.pipe.pipe.FileConstant
import net.technearts.pipe.pipe.NumberConstant
import net.technearts.pipe.pipe.StringConstant

class PipeInterpreter {
	def dispatch Object interpret(Expression e) {
		switch(e) {
			BoolConstant: Boolean.parseBoolean(e.value)
			NumberConstant: e.value
			StringConstant: e.value
			FileConstant: e.value
		}
	}
}